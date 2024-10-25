Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'welcome/index'  # Add this line for the WelcomeController
  resources :products
  root 'welcome#index'
end

