class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:nickname, :avatar)
  end

  def after_sign_out_path_for(resource)
    '/users/sign_in'
  end
end
