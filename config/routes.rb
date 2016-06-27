Rails.application.routes.draw do
  root to: "users#index"
  #user routes
  resources :users
  get "sign_in", to: "sessions#new"
  #session routes
  post "/sessions", to: "sessions#create"
  #art routes
  resources :arts
  #tags routes
  resources :tags

end
