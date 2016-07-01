Rails.application.routes.draw do
  root to: "arts#index"
  #routes to about/contact page
  get "/about", to: "home#about", as: "about"
  get "/contact" , to: "home#contact", as: "contact"
  #user routes
  resources :users

  #session routes
  get "sign_in", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to:"sessions#delete"

  #art routes
  resources :arts do
    get 'search', on: :collection

  end
  #tags routes
  resources :tags

end
