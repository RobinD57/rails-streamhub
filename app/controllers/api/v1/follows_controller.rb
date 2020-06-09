class Api::V1::FollowsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  skip_before_action :authenticate_user!

  def index
    binding.pry
    current_user.identities.map { |identity| identity.follows.delete_all }
    @follows = current_user.get_follows
  end
end
