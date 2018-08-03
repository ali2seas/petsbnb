Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]
  resources :pets do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update] do
    resources :reviews, only: [:new, :create]
  end

  get 'dashboard', to: 'pages#dashboard'


  get '/about', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get '/faq', to: 'pages#faq'


end
