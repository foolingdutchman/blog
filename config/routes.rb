Rails.application.routes.draw do
  get 'comments/index'
  resources :users
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#index"
  get "en" => "application#en"
  get "login" => 'application#login'
  post "login" => 'admin#login'
  get "mining" => "articles#mining"
  get "share" => "articles#share"
  get "dapp"  => "articles#dapp"
end
