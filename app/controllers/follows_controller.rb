class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index

    # token = Identity.find_by(user: current_user, provider: 'twitch').refresh_token
    # RefreshTwitchAccessTokenService.new(refresh_token: token).perform
    current_user.identities.map { |identity| identity.follows.delete_all } # need to increase performance!
    @follows = current_user.get_follows

    # load follows from user model
    # check when they've been loaded, if not long ago just use cache
  end

  def scoped_collection
    Follow.where(identity_id: current_user.id)
  end

  # def create
    # user = User.find(current_user.id)
    # user_data = user.get_follows
    # @follow = user_data.each { |data| Follow.create!(data) }
  # end
  # not needed (for now). Just gets called from the user model method
end
