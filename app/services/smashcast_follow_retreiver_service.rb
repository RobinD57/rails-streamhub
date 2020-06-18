require 'uri'
require 'json'
require 'open-uri'


class SmashcastFollowRetreiverService

  def initialize(params = {})
    @username = params
  end

  def perform
    smashcast
  end

  private

  def smashcast
    url = "https://api.smashcast.tv/following/user?user_name=#{@username}"
    followers_serialized = open(url).read
    followers = JSON.parse(followers_serialized)["following"]
    SmashcastStreamerDetailsService.new(followers).perform
  end
end
