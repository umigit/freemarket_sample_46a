Rails.application.routes.draw do
  root "home#index"
  resources :items, only: [:new, :create]
  get  'users' => 'users#logout'
end
