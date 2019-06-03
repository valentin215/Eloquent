Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/edit'
  devise_for :users
  root to: 'pages#home'
  resources :courses do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:edit, :update, :show]

  resources :bookings, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end
