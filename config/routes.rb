Rails.application.routes.draw do
  #homepage
  get 'welcome/index'
  root 'welcome#index'

  #application routes
  resources :tokens
  resources :incidents
  resources :users
  resources :equipment
  resources :labs
  resources :desks
end
