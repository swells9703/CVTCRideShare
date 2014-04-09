CVTCRideShare::Application.routes.draw do
  resources :ride
  root :to => 'index#index'

end
