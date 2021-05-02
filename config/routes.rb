Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "money#lp"
  resources :money, only: [:index, :new, :create, :show, :destroy]
  resources :bodies, only: [:show, :destroy]
  resources :goals, only: [:new, :create, :show, :update, :destroy]
end
