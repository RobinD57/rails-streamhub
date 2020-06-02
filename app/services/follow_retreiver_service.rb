require 'json'
require 'open-uri'


class Identity
  attr_reader :uid, :token, :provider

  def initialize(params = {})
    @uid = params[:uid]
    @token = params[:token]
    @provider = params[:provider]
  end
end

class FollowRetreiverService
  attr_accessor :identity

  def initialize(params = {})
    @identity = params[:identity]
    # UID from the identity
    # token from credentials
    # should I save credentials in identity and then we just need the identity here, nothing else
    # the flow would be => get all identities from users => iterate over identities
    # => use this service object for each identity to get the followers
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

  # headers: my client ID for a GET request, my client secret for
  # a POST request, the token of the respective user
  end

  def mixer
    url = "https://mixer.com/api/v1/users/#{@identity.uid}/follows"
    followers_serialized = open(url).read # Mixer does not require authorization for this specific API call
    followers = JSON.parse(followers_serialized)
  end
end


peter = Identity.new(uid: "180307681", token: "mhvpzha9o40uno204d0khw2vbnnq28", provider: "mixer")
test = FollowRetreiverService.new(identity: peter).perform
