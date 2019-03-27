Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "items#index"
  resources :items, only: [:new, :create] do
    member do
      get :buy
    end
  end
  resources :user_profiles, only: [:edit,:update]
  resources :users, only: [:index]
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :category
      get :search
    end
  end
  resources :item_images, only: [:destroy]
  resources :categories, only: [:show]
  resources :brands, only: [:show]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :users  do
    collection do
      get :logout
      get :card
    end
  end
  resources :users, only: [:create] do
    resources :items, only: [:show, :destroy] do
      collection do
        get :onsale
        get :orderd
        get :sold
      end
    end
  end
end
