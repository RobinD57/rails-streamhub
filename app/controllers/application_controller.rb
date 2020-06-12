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

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
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
