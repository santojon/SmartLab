Rails.application.routes.draw do
  #login
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    
    authenticated :user do
      root 'home#index'
      
      #application routes
      resources :tokens
      resources :incidents
      resources :users
      resources :equipment
      resources :labs
      resources :desks
    end
    
    root 'devise/sessions#new'
  end
end
