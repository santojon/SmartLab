Rails.application.routes.draw do
  resources :tokens
  resources :incidents
  resources :users
  resources :equipment
  resources :labs
  resources :desks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
