Rails.application.routes.draw do
  #login
  devise_for :users
  devise_scope :user do
    #logout page
    get '/users/sign_out' => 'devise/sessions#destroy'
    
    authenticated :user do
      #root fot logged users
      root 'home#index'
      
      #custom routes
      get "/users/:id/accesses" => "users#accesses"
      get "/desks/:id/access" => "desks#access"
      get "/desks/:id/release" => "desks#release"
      
      #application routes
      resources :tokens
      resources :incidents
      resources :users
      resources :equipment
      resources :labs
      resources :desks
    end
    
    #home for not logged in (login page)
    root 'devise/sessions#new'
    
    #not found
    get "*route" => "home#not_found"
  end
end
