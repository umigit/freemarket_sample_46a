Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :items, only: [:new, :create]
  resources :users  do
    collection do
      get :logout
      get :card
    end
  end
end
