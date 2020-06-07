require 'json'
require 'open-uri'

class FollowRetreiverService
  attr_accessor :identity

  def initialize(params = {})
    @identity = params[:identity]
  end

  def perform
    self.send @identity.provider
  end

  private

  def twitch
    url = "https://api.twitch.tv/helix/users/follows?from_id=#{@identity.uid}&first=100"
    followers_serialized = open(url,
      "Client-ID" => ENV["TWITCH_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    followers = JSON.parse(followers_serialized)
    follow_details = TwitchReceiveStreamerDetailsService.new(followers: followers, identity: @identity).perform
    TwitchTransformService.new(follow_details: follow_details, identity: @identity).perform
  end

  def mixer
    url = "https://mixer.com/api/v1/users/#{@identity.uid}/follows"
    followers_serialized = open(url).read # Mixer does not require authorization for this specific API call
    followers = JSON.parse(followers_serialized)
    MixerTransformService.new(followers).perform
  end

  def google_oauth2
    key = ENV["YOUTUBE_API_KEY"]
    url = "https://www.googleapis.com/youtube/v3/search?part=snippet&eventType=live&maxResults=50&videoCategoryId=20&type=video&mine=true"
    followers_serialized = open(url,
      "Client-ID" => ENV["YOUTUBE_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    followers = JSON.parse(followers_serialized)
    binding.pry
    YoutubeTransformService.new(followers).perform
  end
end
