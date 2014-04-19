CVTCRideShare::Application.routes.draw do
  
  devise_for :users
  root :to => "index#index"
  
  resources :ride do
    collection do
      get 'search'
      get 'results'
    end
  end
  

  
end
