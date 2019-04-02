Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations", sessions: "users/sessions"}
  root "items#index"
  resources :items, only: [:new, :create] do
    member do

    end
  end
  resources :user_profiles, only: [:edit,:update]
  resources :users, only: [:index]
  resources :items do
    collection do
      get :category
      get :search
      post 'pay/:id' => 'items#pay', as: 'pay'
    end
    member do
      get :buy
    end
  end
  resources :item_images, only: [:update, :destroy]
  resources :categories, only: [:show]
  resources :brands, only: [:show]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :users  do
    collection do
      get :logout
      get :card
      get :phone
    end
  end
  resources :users, only: [:create] do
    resources :items, only: [:show] do
      collection do
        get :onsale
        get :orderd
        get :sold
      end
    end
  end
end
