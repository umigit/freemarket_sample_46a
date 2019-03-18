Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :items, only: [:new, :create] do
    member do
      get :buy
    end
  end
  resources :user_profiles, only: [:edit,:update]
  resources :users  do
    collection do
      get :logout
      get :card
    end
  end
end
