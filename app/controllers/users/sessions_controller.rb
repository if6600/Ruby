class Users::SessionsController < Devise::SessionsController
  def success; end

  def after_sign_in_path_for(_resource)
    login_success_path
  end
end
