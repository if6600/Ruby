class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:image, :email, :password, :password_confirmation, :current_password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:image, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
    users_path
  end

  def after_sign_up_path_for(resource)
    users_path
  end

end
