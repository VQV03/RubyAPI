Rails.application.routes.draw do
  resources :auths, only: [:create]

  default_url_options :host => "http://localhost:3000/"

  #PRODUTOS
  resources :categories
  resources :units
  resources :products do 
    collection do 
      get :all
    end
  end
  
  #CLIENTE
  resources :customers do 
    collection do 
      get :all
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
