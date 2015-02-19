Rails.application.routes.draw do

  root to: 'static_pages#index'

  resources :results, only: [:index, :show]
  resources :futures, only: [:index, :show]
end
