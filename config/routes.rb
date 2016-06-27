Rails.application.routes.draw do

  #user routes
  resources :users
  #art routes
  resources :arts
  #tags routes
  resources :tags

end
