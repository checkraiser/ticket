Ticket::Application.routes.draw do
  
  root "projects#index"
  resources :projects do  
  	resources :mtickets
  end
  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
