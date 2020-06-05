class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @follows = Follow.all
    # ids = current_user.identities.map { |x| x.identity_id }
    # @follows = Follow.where( (identity_id: ids[0] && identity_id: ids[1]) || identity_id: ids[0] )
    # raise

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
