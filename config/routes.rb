Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"
   
  devise_for :users
  # Defines routes for users

  resources :vendors

  resources :option_types

  resources :option_values, except: [:index, :show]

  resources :variants, except: [:index, :show]

  resources :products
  resources :carts
  get 'cart', to: 'cart#show', as: :cart_path
  post 'cart/add', to: 'cart#add', as: :cart_add
  post 'cart/remove', to: 'cart#remove', as: :cart_remove

  # Defines routes for admin
  namespace :admin do
    root "products#index"
    resources :vendors

    resources :option_types

    resources :option_values, except: [:index, :show]

    resources :variants, except: [:index, :show]

    resources :products
  end
end
