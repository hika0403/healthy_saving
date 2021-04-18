Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root "money#index"
  resources :money
  resources :bodies, only: [:show, :destroy]
  resources :goals, only: [:new, :create, :show, :destroy]
end
