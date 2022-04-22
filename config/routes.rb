Rails.application.routes.draw do
  resources :orders
  resources :menus
  resources :customers
  resources :order_details
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/set_current_customer', to: 'customers#set_current_customer'

  # Defines the root path route ("/")
  root "customers#home"
  # root "articles#index"
end
