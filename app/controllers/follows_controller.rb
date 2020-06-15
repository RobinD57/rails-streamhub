class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    current_user.identities.map { |identity| identity.follows.delete_all } # need to increase performance!
    @follows = current_user.get_follows
  end

  def sorted_collection
    @follows = current_user.identities.map { |identity| Follow.where(identity_id: identity.id) }.flatten
    @follows = Follow.includes([:identity]).where(id: @follows.map(&:id))
    if params[:sort] == "views"
      @follows = @follows.order(viewers: :desc)
    elsif params[:sort] == "alpha"
      @follows = @follows.order_by_streamer_name
    end
    render layout: false
  end

  def dlive
    Identity.create!(provider: "dlive", uid: rand(1..50000), user: current_user)
    DliveRetreiverService.new(username: current_user.username)
  end

  private

  def follows_params
    params.require(:follow).permit(:user_name)
  end
end
