Rails.application.routes.draw do

  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/edit'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'pages#home'
  resources :courses do
    resources :bookings, only: [:new, :create, :update]
    resources :payments, only: [:new, :create]
  end

  resources :users, only: [:edit, :update, :show]


  resources :bookings, only: [:show]

  resources :bookings, only: [] do
    resources :reviews, only: [ :new, :create ]
  end
end
