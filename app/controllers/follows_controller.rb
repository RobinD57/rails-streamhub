class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @follows = Follow.all

    # load follows from user model
    # check when they've been loaded, if not long ago just use cache

  end

  def create
    user = User.find(current_user.id)
    user_data = user.get_follows
    @follow = user_data.each { |data| Follow.create!(data) }
  end
end
