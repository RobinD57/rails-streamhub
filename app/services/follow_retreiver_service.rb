require 'json'
require 'open-uri'

class FollowRetreiverService
  def initialize(params) # CHANGE
    @user = params[:user]
    @identity = params[:identity]
  end

  def perform
    @identity.send "#{@identity.provider}", "#{@user.uid}"
  end

  private

  def twitch(uid)
    url = "https://api.twitch.tv/kraken/users/#{uid}/follows/channels"
    followers_serialized = open(url).read
    followers = JSON.parse(followers_serialized)
  end

  def mixer
  end

end
