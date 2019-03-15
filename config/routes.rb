Rails.application.routes.draw do
  root "home#index"

  get   'users'   =>  'users#logout'
end


