Rails.application.routes.draw do
  #login
  get 'login/index'
  root 'login#index'
  
  #homepage (after login)
  get 'home', to: 'home#index'

  #application routes
  resources :tokens
  resources :incidents
  resources :users
  resources :equipment
  resources :labs
  resources :desks
end
