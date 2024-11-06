Rails.application.routes.draw do
  # Route for store index with a named route
  get '/store', to: 'store#index', as: 'store_index'
  resources :line_items
  resources :carts
  resources :products
  
  # Welcome index route
  get 'welcome/index'
  
  # Root path
  root 'welcome#index'
end

