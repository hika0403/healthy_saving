Rails.application.routes.draw do
  devise_for :users
  root "money#lp"
  resources :money, only: [:index, :new, :create, :show, :destroy]
  resources :bodies, only: [:show, :destroy]
  resources :goals, only: [:new, :create, :show, :destroy]
end
