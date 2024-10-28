Rails.application.routes.draw do
  # Route for store index
  get '/store', to: 'store#index'
  resources :line_items
  resources :carts
  resources :products
  
  # Welcome index route
  get 'welcome/index'
  
  # Root path
  root 'welcome#index'
end

