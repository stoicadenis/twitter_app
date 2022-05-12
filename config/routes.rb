Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#hello"

  get 'other_route', to: 'application#other_route'
  get 'create_user', to: 'application#create_user'
  resources :users

  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy'
  # get 'users', to:'users#index'
  # get 'users/new', to:'users#new'
  # get 'users/:id', to:'users#show'
  # post 'users', to: 'users#create'
end
