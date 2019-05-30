Rails.application.routes.draw do
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
end
