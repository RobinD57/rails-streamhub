# additional service object for Dlive as the process is way different
require 'uri'
require 'json'
require 'open-uri'


class DliveRetreiverService

  def initialize(params = {})
    @user_name = params[:user_name]
  end

  def perform
    dlive
  end

  private

  def dlive
    url = URI.encode("https://graphigo.prd.dlive.tv/?query={userByDisplayName(displayname:\"#{@user_name}\"){following{list{username avatar displayname livestream{title thumbnailUrl watchingCount category{title imgUrl }}}}}}")
    followers_serialized = open(url).read
    followers = JSON.parse(followers_serialized)
    DliveTransformService.new(followers.dig("data", "userByDisplayName", "following", "list")).perform
  end
end
