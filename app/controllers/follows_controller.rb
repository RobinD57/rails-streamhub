class FollowsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @follows = Follow.all
  end
end
