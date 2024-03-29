Rails.application.routes.draw do
  resources :orders
  resources :menus
  resources :customers
  resources :order_details
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/set_current_customer', to: 'customers#set_current_customer'
  get 'logout', to:'customers#logout'

  get '/reports', to: 'reports#index'
  get '/todays_report', to: 'reports#todays_report'
  post '/report_by_date_range', to: 'reports#report_by_date_range'
  post '/report_by_customer', to: 'reports#report_by_customer'
  post '/report_by_greater_than', to: 'reports#report_by_greater_than'
  post '/report_by_lower_than', to: 'reports#report_by_lower_than'

  # Defines the root path route ("/")
  root "customers#home"
  # root "articles#index"
end
