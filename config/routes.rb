Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:new, :create] do
    member do
      get :buy
    end
  end
  resources :user_profiles, only: [:edit,:update]
  resources :users, only: [:index]

  resources :items, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :category
    end
  ends
  resources :user_profiles, only: [:edit, :update]
  resources :addresses, only: [:new, :create, :edit, :update]
  resource :users  do
    collection do
      get :logout
      get :card
    end
  end
  resources :item_images, only: [:index]
end
