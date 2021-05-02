Rails.application.routes.draw do
  get 'bonuseshistory/bonuseshistory'
  get 'partners/partners'
  get 'bonusespopular/bonusespopular'
  get 'bonusesinfo/bonusesinfo'
  get 'bonus/bonuses'
  resources :follows
  resources :categories
  mount Ckeditor::Engine => '/ckeditor'
  devise_scope :user do
    get 'thank-you/', to: 'users/registrations#success', as: 'registration_success'
    get 'welcome/', to: 'users/sessions#success', as: 'login_success'
  end
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' },
                     path_names: { sign_up: 'register', sign_in: 'login', sign_out: 'logout' }
  resources :users
  post 'users/:id/follow', to: 'users#follow', as: 'follow_user'
  post 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow_user'
  resources :posts do
    resources :comments
    resources :likes
    resources :favorites
  end
  resources :subscribers
  get 'posts/index'

  # root 'posts#index'
  get 'promo', to: 'promo#index'
  get 'about', to: 'about#index'
  get 'charity', to: 'charity#index'
  get 'bonuses', to: 'bonuses#index'
  get 'bonusesinfo', to: 'bonusesinfo#bonusesinfo'
  get 'bonusespopular', to: 'bonusespopular#bonusespopular'
  get 'partners', to: 'partners#partners'
  get 'bonuseshistory', to: 'bonuseshistory#bonuseshistory'

  root 'promo#index'

  get 'search', to: 'search#search'

  get 'users', to: 'users#index'
  get 'users/:id' => 'users#show'
  delete 'users/:id', to: 'users#destroy'
  get 'users/:id/following', to: 'users#following', as: :following
end
