Rails.application.routes.draw do

  root to: 'pages#home'

  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/edit'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # get 'auth/facebook/callback', to: 'users#create'
  # get 'auth/failure', to: redirect('/')

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
