Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"
   
  devise_for :users

  # Defines routes for admin
  namespace :admin do
    root "products#index"
    resources :vendors

    resources :option_types

    resources :variants

    resources :products
  end

  # Defines routes for users

  resources :vendors, only: [:index, :show] 

  resources :products, only: [:index, :show] 
end
