Rails.application.routes.draw do
  resources :companies
  root "users#index"

  devise_for :users 
  post "/new_user", to: "users#create"
  get "/new_user", to: "users#new"
  resources :users


  # Defines the root path route ("/")
  # post "auth/github", as: :github_login
  # get "auth/github/callback", to: "sessions:create"
end
