require 'json'
require 'open-uri'

class TwitchReceiveStreamerDetailsService

  def initialize(params = {})
    @identity = params[:identity]
    @twitch_follows = params[:followers]["data"]
  end


  def perform
    get_follow_details
  end

  private

  def get_follow_details
    url = "https://api.twitch.tv/helix/streams?"
    @twitch_follows.each { |follow| url << "user_id=#{follow["to_id"]}&" }
    followers_serialized = open(url,
      "Client-ID" => ENV["TWITCH_APP_ID"],
      "Authorization" => "Bearer #{@identity.token}").read
    JSON.parse(followers_serialized)
  end
end
