Rails.application.routes.draw do
  resources :genres
  resources :games
  resources :reviews
  resources :users
  resources :about
  resources :suggest
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
