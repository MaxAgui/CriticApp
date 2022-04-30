Rails.application.routes.draw do
  resources :companies
  root "users#index"

  devise_for :users 
  post "/new_user", to: "users#create"
  get "/new_user", to: "users#new"
  # get "/new_user", to: "users#create"
  # resources :users, only: %i[new, show]
   resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post "auth/github", as: :github_login
end
