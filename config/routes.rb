Rails.application.routes.draw do
  devise_for :users
  resources :money
  root "money#index"
  resources :moneys
end
