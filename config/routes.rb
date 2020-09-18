Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :show, :edit, :create, :update]
  resources :orders, only: :index
end
