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
      @follows = @follows.order_by_streamer_name
    end
  end

  def sorted_collection
    @follows = Follow.all
    if params[:sort] == "views"
      @follows = @follows.order(viewers: :desc)
    elsif params[:sort] == "alpha"
      @follows = @follows.order_by_streamer_name
    end
    render layout: false
  end

  def scoped_collection
    Follow.where(identity_id: current_user.id)
  end

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def home
  end

  def check_signed_in
    redirect_to follows_path if signed_in?
  end

  private
   # def refresh_twitch_token
   #    refresh_token = Identity.find_by(user: current_user, provider: 'twitch').refresh_token
   #    new_access_token = TwitchRefreshAccessTokenService.new(refresh_token: refresh_token).perform
   #    current_user.identities.update(token:  new_access_token)
   # end
end
