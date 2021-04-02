Rails.application.routes.draw do
  devise_for :users
  root "money#index"
  resources :money
  resources :goals
end
