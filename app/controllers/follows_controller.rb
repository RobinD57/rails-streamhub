class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    refresh_twitch_token
    current_user.identities.map { |identity| identity.follows.delete_all } # need to increase performance!
    @follows = current_user.get_follows
    if params[:sort] == "views"
      @follows = @follows.order(viewers: :desc)
    elsif params[:sort] == "alpha"
      @follows = @follows.order(:streamer_name)
    end

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
  #
  private

  def refresh_twitch_token
    refresh_token = Identity.find_by(user: current_user, provider: 'twitch').refresh_token
    old_access_token = Identity.find_by(user: current_user, provider: 'twitch').token
    new_access_token = RefreshTwitchAccessTokenService.new(refresh_token: refresh_token).perform
    current_user.identities.update(token:  new_access_token)
  end


end
