Rails.application.routes.draw do
  resources :users do
    resources :tweets, only: [:new, :create]
  end
  get "tweets/index"
  resources :users
  root "users#index"

  resources :sessions, only: [:new, :create, :destroy]
end
