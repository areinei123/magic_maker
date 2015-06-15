Rails.application.routes.draw do
  root 'expansions#index'
  devise_for :users
  resources :expansions, only: [:index]
end
