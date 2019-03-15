Rails.application.routes.draw do
  root "home#index"
  resources :items, only: [:new, :create]
end
