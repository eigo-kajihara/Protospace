Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get 'prototypes/newest' => 'prototypes#newest'
  resources :prototypes, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
end
