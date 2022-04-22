Rails.application.routes.draw do
  resources :orders
  resources :menus
  resources :customers
  resources :order_details
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/set_current_customer', to: 'customers#set_current_customer'

  get '/reports', to: 'reports#index'
  get '/todays_report', to: 'reports#todays_report'

  # Defines the root path route ("/")
  root "customers#home"
  # root "articles#index"
end
