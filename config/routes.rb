Rails.application.routes.draw do
  get 'comments/index'
  resources :users
  resources :articles
  resources :admins
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"
  get "en" => "application#en"
  get "login" => 'application#login'
  post "login" => 'admins#login'
  get "mining" => "articles#mining"
  get "share" => "articles#share"
  get "dapp"  => "articles#dapp"
  get "logout" => "application#logout"
end
