Rails.application.routes.draw do
  devise_scope :user do
    get '/sign_up' => 'users/registrations#sign_up'
    get '/sign_up/registration' => 'users/registrations#new'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations", sessions: "users/sessions"}
  root "items#index"
  resources :items, only: [:new, :create] do
    member do
      get :buy
    end
  end
  resources :users, only: [:index]  do
    collection do
      get :logout
      get :card
      get :phone
    end
  end
  resources :user_profiles, only: [:edit,:update]
  resources :items do
    collection do
      get :category
      get :search
    end
  end
  resources :item_images, only: [:destroy]
  resources :categories, only: [:show]
  resources :brands, only: [:show]
  resources :addresses, only: [:new, :create, :edit, :update]

  resources :users, only: [:create] do
    resources :items, only: [:show] do
      collection do
        get :onsale
        get :orderd
        get :sold
      end
    end
  end


end
