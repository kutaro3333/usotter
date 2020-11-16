Rails.application.routes.draw do
  resources :users do
    resources :tweets, only: [:new, :create]
  end
  get "tweets/index"
  resources :users
  root "users#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :sessions, only: [:new,:create,:destroy]
end
