Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_scope :user do
    get 'thank-you', to: 'users/registrations#success', as: 'registration_success'
    get 'welcome', to: 'users/sessions#success', as: 'login_success'
  end
  devise_for :users, module: 'users',
                     path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout' }
  resources :users
  post 'users/:id/follow', to: 'users#follow', as: 'follow_user'
  post 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
  get 'users/:id/following', to: 'users#following', as: :following

  resources :posts do
    member do
      put 'update_published'
    end
    resources :comments
    resources :likes
    resources :favorites
  end
  resources :subscribers
  resources :categories

  scope :bonuses, controller: :bonuses, as: :bonuses do
    get 'info'
    get 'popular'
    get 'history'
    get 'partners'
  end
  resources :bonuses

  get 'promo', to: 'promo#index'
  get 'charity', to: 'charity#index'
  get 'search', to: 'search#search'

  root 'promo#index'
end
