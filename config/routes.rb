Ticket::Application.routes.draw do
  
  namespace :admin do 
  	root :to => 'base#index'
  	resources :users do 
  		resources :permissions
      put "permissions", to: "permissions#set", as: "set_permissions"
  	end
  end
  root "projects#index"
  resources :projects do  
  	resources :mtickets
  end
  resources :files
  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
end
