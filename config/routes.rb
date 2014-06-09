Ticket::Application.routes.draw do
  
  namespace :admin do 
  	root :to => 'base#index'
  	resources :users
  end
  root "projects#index"
  resources :projects do  
  	resources :mtickets
  end
  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
