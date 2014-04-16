CVTCRideShare::Application.routes.draw do
  
  root :to => "index#index"
  get "ride/index"
  get "ride/new"
  get "ride/search"
  get "ride/results"
  
  resources :ride do
    collection do
      get 'search'
      get 'results'
    end
  end
  root :to => 'index#index'
  

  
end
