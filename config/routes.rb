CVTCRideShare::Application.routes.draw do
  resources :ride
  root :to => 'index#index'
  
  post '/ride/search/:search', to: 'ride#search'
  
end
