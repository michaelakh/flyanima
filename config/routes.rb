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
  get '/pages/pet_selfie_challenge', to:"pages#petSelfie", as:"/pet_selfie_challenge"
  get '/pages/top_deals', to:"pages#topDeals", as:"/top_deals"
  root 'pages#home'
    
  get 'contact', to: 'messages#new', as: 'contact'
  post 'contact', to: 'messages#create'
    
  get 'search_flights', to:"searches#new", as: 'search_flights'
  get 'search', to:"searches#index" , as: 'search'
  post 'search_googleQPX', to:"searches#googleQPX" , as: 'search_googleQPX'
  get 'search_show', to:"searches#show" , as: 'search_show'
  post 'search_flights', to:"searches#create" 
  
  get '/city_airport_ita_codes/autocomplete', to:"city_airport_ita_codes#autocomplete", as:"city_airport_ita_codes/autocomplete"
    
  get 'airports/autocomplete', to:"airports#autocomplete", as:"airports/autocomplete"
  get 'contact/airlines', to:"searches#contact", as:"contact/airlines"  
  TinoUk::Application.routes.draw do
  resources :airports do
    collection { post :import }
  end
    root to: "airports#index"
  end

  TinoUk::Application.routes.draw do
  resources :city_airport_ita_codes do
    collection { post :import }
  end
  
  root to: "city_airport_ita_codes#index"
  end

  TinoUk::Application.routes.draw do
  resources :airlines do
    collection { post :import }
  end
    root to: "airports#index"
  end
end
