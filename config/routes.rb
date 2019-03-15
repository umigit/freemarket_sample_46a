Rails.application.routes.draw do
  root "home#index"
  resources :items, only: [:new, :create]
  resources :users  do
    collection do
      get :logout
    end
  end
end
