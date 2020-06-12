class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    current_user.identities.map { |identity| identity.follows.delete_all } # need to increase performance!
    @follows = current_user.get_follows
  end

  def sorted_collection
    @follows = current_user.identities.map { |identity| Follow.where(identity_id: identity.id) }.flatten
    @follows = Follow.where(id: @follows.map(&:id))
    if params[:sort] == "views"
      @follows = @follows.order(viewers: :desc)
    elsif params[:sort] == "alpha"
      @follows = @follows.order_by_streamer_name
    end
    render layout: false
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

  def follows_params
    params.require(:follow).permit(:user_name)
  end
end
