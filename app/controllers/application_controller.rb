class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      follows_path({ first_sign_in: true })
    else
      follows_path
   end
 end

  def after_sign_out_path_for(resource)
    root_path
  end
end
