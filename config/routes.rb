CVTCRideShare::Application.routes.draw do
  
  root :to => "index#index"
  
  resources :ride do
    collection do
      get 'search'
      get 'results'
    end
  end
  

  
end
