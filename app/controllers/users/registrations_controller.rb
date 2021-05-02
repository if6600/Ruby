class Users::RegistrationsController < Devise::RegistrationsController
  def success; end

  def after_sign_up_path_for(_resource)
    registration_success_path
  end
end
