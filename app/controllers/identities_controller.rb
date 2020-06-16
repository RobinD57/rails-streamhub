class IdentitiesController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @identity = Identity.find(params[:id])
    @identity.destroy
    redirect_back(fallback_location: root_path)
    # current_user.identities.find_by(provider: "#{provider}").destroy
    # current_user.identities.find_by(provider: "mixer").id
  end

  private

  def identity_params
    params.require(:identity).permit(:id)
  end
end
