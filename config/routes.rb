Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: [:show, :edit, :update]
  get   '/tags'  =>  'prototypes#tags'       #tag一覧画面
end
