class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :check_signed_in

  helper_method :resource_name, :resource, :devise_mapping, :resource_class
end
