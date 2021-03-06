# additional service object for Dlive as the process is different as we don't
# have permission to use OAuth from them yet
require 'uri'
require 'json'
require 'open-uri'


class DliveRetreiverService

  def initialize(params = {})
    @username = params
  end

  def perform
    dlive

  end

  private

  def dlive
    url = URI.encode("https://graphigo.prd.dlive.tv/?query={userByDisplayName(displayname:\"#{@username}\"){following{list{username avatar displayname livestream{title thumbnailUrl watchingCount category{title imgUrl }}}}}}")
    followers_serialized = open(url).read
    followers = JSON.parse(followers_serialized)
    DliveTransformService.new(followers.dig("data", "userByDisplayName", "following", "list")).perform
  end
end
