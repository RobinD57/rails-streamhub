require 'uri'
require 'json'
require 'open-uri'

class SmashcastStreamerDetailsService

  def initialize(params = {})
    @smashcast_follows = params
  end


  def perform
    get_follow_details
  end

  private

  def get_follow_details
    smashcast_follows_details = @smashcast_follows.map do |f|
      url = "https://api.smashcast.tv/media/live/"
      url << "#{f["user_name"]}"
        details_serialized = open(url).read
        JSON.parse(details_serialized)
    end
    SmashcastTransformService.new(smashcast_follows_details).perform
  end
end

