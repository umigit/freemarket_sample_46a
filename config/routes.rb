Rails.application.routes.draw do
  root "home#index"
  resources :items, only: [:new, :create]
  resources :users, only: [:index]
end
