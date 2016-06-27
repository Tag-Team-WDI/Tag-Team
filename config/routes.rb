Rails.application.routes.draw do
  root to: "users#index"
  #user routes
  resources :users

  #session routes
  get "sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to:"sessions#delete"

  #art routes
  resources :arts
  #tags routes
  resources :tags

end
