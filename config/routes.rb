Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :pets do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update] do
    resources :reviews, only: [:new, :create]
  end
  get 'dashboard', to: 'pages#dashboard'

end
