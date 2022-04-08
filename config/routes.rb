Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#hello"

  get 'other_route', to: 'application#other_route'
  get 'create_user', to: 'application#create_user'
end
