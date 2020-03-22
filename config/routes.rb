Rails.application.routes.draw do

  root to: 'pages#home'

  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/edit'

  get 'bookings/thanks_page_booking'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # devise_scope :user do
  #   get '/auth/facebook/callback', to: 'devise/sessions#new'
  #   get '/auth/failure', to: 'devise/sessions#new'
  # end

  resources :courses do
    resources :bookings, only: [:new, :create, :update]
  end


  resources :users, only: [:edit, :update, :show]

  resources :bookings, only: [:show]

  resources :bookings, only: [] do
    resources :reviews, only: [ :new, :create ]
  end
end
