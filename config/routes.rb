Rails.application.routes.draw do

  devise_for :users,
  controllers: {
  sessions: 'users/sessions' ,
  registrations: 'users/registrations',
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get "users/sign_up/registration", to: "users/registrations#sns", as: "new_user_signup_registration"
    get "users/sign_up/sms_confirmation", to: "users/registrations#phone", as: "new_user_signup_sms_confirmation"
    get "users/sign_up/address_confirmation", to: "users/registrations#address", as: "new_user_signup_address_confirmation"
    get "users/sign_up/credit_confirmation", to: "users/registrations#credit", as: "new_user_signup_credit_confirmation"
  end

  root "items#index"
  resources :items, only: [:new, :create] do
    member do

    end
  end
  resources :user_profiles, only: [:edit,:update]
  resources :users, only: [:index]
  resources :items do
    collection do
      get :category
      get :search
      post 'pay/:id' => 'items#pay', as: 'pay'
    end
    member do
      get :buy
    end
  end

  resources :addresses

  resources :item_images, only: [:destroy]

  resources :item_images, only: [:update, :destroy]

  resources :categories, only: [:show]
  resources :brands, only: [:show]
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
  resources :items do
    resources :comments, only: [:create]
  end
  resources :comments
end


