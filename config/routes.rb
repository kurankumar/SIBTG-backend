Rails.application.routes.draw do
  resources :genres
  resources :games
  resources :reviews
  resources :about
  resources :suggest
  resources :wishlists
  resources :user_games

  resources :users
  post "/login", to: "auth#create"
  get "/profile", to: "users#profile"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
