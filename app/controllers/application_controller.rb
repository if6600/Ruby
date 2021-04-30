class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:image, :email, :password, :password_confirmation, :current_password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:image, :email, :password, :password_confirmation, :current_password)
    end
  end

  def after_sign_in_path_for(_resource)
    login_path
  end

  def after_sign_up_path_for(_resource)
    registration_path
  end
end
