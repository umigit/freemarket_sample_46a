Rails.application.routes.draw do
  root "home#index"
  resources :users, only: [:index]
  resources :items, only: [:new, :create]
end
