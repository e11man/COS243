Rails.application.routes.draw do
  get 'welcome/index'  # Add this line for the WelcomeController
  get 'store/index'
  resources :products
  root 'welcome#index'
end

