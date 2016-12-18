Rails.application.routes.draw do
  
  devise_for :users
    
  resources :posts do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end

  get "/pages/*page" => "pages#show"
  get "/pages/home" => "pages#home"
  root 'pages#home'
end
