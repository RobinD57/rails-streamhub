class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    # if @identity
    #   refresh_twitch_token
    # end
    current_user.identities.map { |identity| identity.follows.delete_all } # need to increase performance!
    @follows = current_user.get_follows
    if params[:sort] == "views"
      @follows = @follows.order(viewers: :desc)
    elsif params[:sort] == "alpha"
      @follows = @follows.order(:streamer_name)
    end
  end

  def scoped_collection
    Follow.where(identity_id: current_user.id)
  end

  private
   # def refresh_twitch_token
   #    refresh_token = Identity.find_by(user: current_user, provider: 'twitch').refresh_token
   #    new_access_token = RefreshTwitchAccessTokenService.new(refresh_token: refresh_token).perform
   #    current_user.identities.update(token:  new_access_token)
   # end
end
