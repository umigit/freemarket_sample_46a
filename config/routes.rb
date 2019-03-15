Rails.application.routes.draw do
  root "home#index"
  resources :items, only: [:new, :create]
  get 'items/category' => 'items#category'
end
