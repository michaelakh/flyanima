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
    
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
    
  get 'search_flights', to:"searches#new", as: 'search_flights'
  get 'search', to:"searches#show" , as: 'search'
  post 'search_flights', to:"searches#create" 
end
