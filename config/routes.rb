Rails.application.routes.draw do
  
  root 'sessions#new'

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'sign_up' => 'users#new'
end
