CVTCRideShare::Application.routes.draw do

  resources :ride do
    collection do
      get 'search'
      get 'results'
    end
  end
  root :to => 'index#index'
  

  
end
