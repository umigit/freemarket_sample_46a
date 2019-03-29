Rails.application.routes.draw do

  devise_for :users,
  controllers: {
  sessions: 'users/sessions' ,
  registrations: 'users/registrations',
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get "users/sign_up/registration", to: "users/registrations#sns", as: "new_user_signup_registration"
  end

  root "items#index"
  resources :items, only: [:new, :create] do
    member do
      get :buy
    end
  end
  resources :user_profiles, only: [:edit,:update]
  resources :users, only: [:index]
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
  resources :users  do
    collection do
      get :logout
      get :card
      get :phone
    end
  end
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


