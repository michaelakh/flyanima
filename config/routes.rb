Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/pages/*page" => "pages#show"
  get "/pages/home" => "pages#home"
  root 'pages#home'
end
