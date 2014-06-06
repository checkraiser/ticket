Ticket::Application.routes.draw do
  root "projects#index"
  resources :projects do  
  	resources :mtickets
  end
end
