Rails.application.routes.draw do
  resources :involved_companies
  root "games#index"
  resources :genres
  resources :games do
    # resources :critics

    # /games/:id/add_genre
    post "add_genre", on: :member
    # /games/:id/remove_genre
    delete "remove_genre", on: :member

    # /games/:id/add_platform
    post "add_platform", on: :member
    # /games/:id/remove_platform
    delete "remove_platform", on: :member
  end

  resources :companies

  devise_for :users
  post "/new_user", to: "users#create"
  get "/new_user", to: "users#new"
  get '/auth/github/callback', to: 'sessions#create'
  resources :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  #resources :users

end
