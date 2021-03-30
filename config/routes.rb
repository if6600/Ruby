Rails.application.routes.draw do
  get 'bonuseshistory/bonuseshistory'
  get 'partners/partners'
  get 'bonusespopular/bonusespopular'
  get 'bonusesinfo/bonusesinfo'
  get 'login/login'
  get 'bonus/bonuses'
  resources :follows
  resources :categories
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :users
  post 'users/:id/follow', to: "users#follow", as: "follow_user"
  post 'users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  #get 'about/index'
  #get 'promo/index'
  resources :posts do
    resources :comments
    resources :likes
    resources :favorites
  end
  resources :subscribers
  get 'posts/index'

  #root 'posts#index'
  get 'promo', to: 'promo#index'
  get 'about', to: 'about#index'
  get 'charity', to: 'charity#index'
  get 'bonuses', to: 'bonuses#index'
  get 'login', to: 'login#login'
  get 'bonusesinfo', to: 'bonusesinfo#bonusesinfo'
  get 'bonusespopular', to: 'bonusespopular#bonusespopular'
  get 'partners', to: 'partners#partners'
  get 'bonuseshistory', to: 'bonuseshistory#bonuseshistory'

  root 'promo#index'

  get "search", to: "search#search"

  get 'users', to: 'users#index'
  get 'users/:id' => 'users#show'
  delete 'users/:id', to: 'users#destroy'
  get 'users/:id/following', :to => "users#following", :as => :following
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
