Rails.application.routes.draw do

  root to: 'static_pages#index'

  resources :results, only: [:index]
  resources :futures, only: [:index]
  resources :reviews, only: [:index]
end
