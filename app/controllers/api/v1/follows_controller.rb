class Api::V1::FollowsController < Api::V1::BaseController

  def index
    current_user.identities.map { |identity| identity.follows.delete_all }
    @follows = current_user.get_follows
  end
end
