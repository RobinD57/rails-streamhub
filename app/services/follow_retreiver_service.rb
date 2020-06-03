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
    url = "https://api.twitch.tv/helix/users/follows?from_id=#{@identity.uid}"
    followers_serialized = open(url,
      "Client-ID" => ENV["TWITCH_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    followers = JSON.parse(followers_serialized)
    follow_details = TwitchReceiveStreamerDetailsService.new(followers: followers, identity: @identity).perform
    TwitchTransformService.new(follow_details).perform
  end

  def mixer
    url = "https://mixer.com/api/v1/users/#{@identity.uid}/follows"
    followers_serialized = open(url).read # Mixer does not require authorization for this specific API call
    followers = JSON.parse(followers_serialized)
    MixerTransformService.new(followers).perform
  end
end


=begin

class Identity
  attr_reader :uid, :token, :provider

  def initialize(params = {})
    @uid = params[:uid]
    @token = params[:token]
    @provider = params[:provider]
  end
end

peter = Identity.new(uid: "180307681", token: "mhvpzha9o40uno204d0khw2vbnnq28", provider: "mixer")
test = FollowRetreiverService.new(identity: peter).perform
=end

# the above is just for testing
