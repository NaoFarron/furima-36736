Rails.application.routes.draw do
  get 'card_registrations/new'
  get 'users/show'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :buys, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
  resources :card_registrations, only: [:new, :create]
end
