require 'json'
require 'open-uri'


class FollowRetreiverService

  def initialize(params = {})
    @identity = params[:identity]
  end

  def perform
    self.send @identity.provider
  end

  private

  def twitch
    refresh_twitch_token
    url = "https://api.twitch.tv/helix/users/follows?from_id=#{@identity.uid}&first=100"
    followers_serialized = open(url,
      "Client-ID" => ENV["TWITCH_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    followers = JSON.parse(followers_serialized)
    if followers["data"].length == 100
      url << "&after#{followers["pagination"]["cursor"]}" # works for 200 follows now
      twitch()
    end
    follow_details = TwitchReceiveStreamerDetailsService.new(followers: followers, identity: @identity).perform
    TwitchTransformService.new(follow_details: follow_details, identity: @identity).perform
  end

  def mixer
    url = "https://mixer.com/api/v1/users/#{@identity.uid}/follows?limit=100&page=0"
    followers_serialized = open(url).read # Mixer does not require authorization for this specific API call
    followers = JSON.parse(followers_serialized)
    if followers.length == 100
      url.gsub("page=0", "page=1") # works for 200 follows now
      mixer()
    end
    MixerTransformService.new(followers).perform
  end

  def google_oauth2
    key = ENV["YOUTUBE_API_KEY"]
    url = "https://www.googleapis.com/youtube/v3/search?part=snippet&eventType=live&maxResults=50&videoCategoryId=20&type=video&mine=true"
    followers_serialized = open(url,
      "Client-ID" => ENV["YOUTUBE_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    followers = JSON.parse(followers_serialized)
    # YoutubeTransformService.new(followers).perform
  end

  def refresh_twitch_token
    refresh_token = Identity.find(@identity.id).refresh_token
    new_access_token = RefreshTwitchAccessTokenService.new(refresh_token: refresh_token).perform
    binding.pry
    @identity.token = new_access_token
    @identity.save
  end

end

# https://www.googleapis.com/youtube/v3/subscriptions?part=snippet%2CcontentDetails&mine=true&maxResults=50
# => gives me all my subs

# https://www.googleapis.com/youtube/v3/liveBroadcasts?part=snippet%2CcontentDetails%2Cstatus&broadcastStatus=active&broadcastType=all
# no proper return

# https://www.googleapis.com/youtube/v3/liveStreams?part=snippet%2Ccdn%2CcontentDetails%2Cstatus&id=YOUR_STREAM_ID
# only properly works if it's your own broadcast

# https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=UCHpC-6gbyYWhyV5oAYcOfMA&eventType=live&type=video
# => Can only enter 1 id, no comma-separated list of IDs as input available
