Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :items, only: [:new, :create]
  get 'items/category' => 'items#category'
  resources :user_profiles, only: [:edit,:update]
  resources :users  do
    collection do
      get :logout
      get :card
    end
  end
end
