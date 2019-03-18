Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :users, only: [:index]
  resources :items, only: [:new, :create] do
    collection do
      get :category
    end
  end
  resources :user_profiles, only: [:edit, :update]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :users  do
    collection do
      get :logout
      get :card
    end
  end
end
