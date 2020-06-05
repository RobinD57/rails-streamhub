class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    token = Identity.find_by(user: current_user, provider: 'twitch').refresh_token
    RefreshTwitchAccessTokenService.new(refresh_token: token).perform
    @follows = Follow.all
    # load follows from user model
    # check when they've been loaded, if not long ago just use cache

  end

  # def create
    # user = User.find(current_user.id)
    # user_data = user.get_follows
    # @follow = user_data.each { |data| Follow.create!(data) }
  # end
  # not needed (for now). Just gets called from the user model method
end
