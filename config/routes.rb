Rails.application.routes.draw do
  resources :money
  root "money#index"
  resources :moneys
end
