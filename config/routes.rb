Rails.application.routes.draw do

  root "site#index"

  get '/profile', to: "users#show", as: :profile
  get '/signup', to: "users#new", as: :signup
  get '/login', to: "sessions#new", as: :login
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
 
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
