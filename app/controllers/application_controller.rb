class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :menu_navs, :menu_actions
  protect_from_forgery unless: -> { request.format.json? }

  def menu_navs
    menu_navs = [
      { name: 'Новости', route: promos_path },
      { name: 'Обучение', route: posts_path },
      { name: 'Благотворительность', route: charity_path },
      { name: 'Бонусы', route: bonuses_info_path }
    ]
    menu_navs.push({ name: 'Категории', route: categories_path }) if user_signed_in? && current_user
    @menu_navs = menu_navs
  end

  def menu_actions
    @menu_actions = if user_signed_in?
                      [
                        { name: 'Аккаунт', route: user_path(current_user.id), method: '' },
                        { name: 'Выйти', route: destroy_user_session_path, method: 'delete' }
                      ]
                    else
                      [
                        { name: 'Вход', route: new_user_session_path, method: '' },
                        { name: 'Регистрация', route: new_user_registration_path, method: '' }
                      ]
                    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:image, :email, :password, :password_confirmation, :current_password)
    end
  end

end
