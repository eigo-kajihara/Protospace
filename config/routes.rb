Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get 'prototypes/newest' => 'prototypes#newest'
  resources :prototypes, only: [:index, :new, :create, :show, :destroy] do
   resources :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :users, only: [:show, :edit, :update]
  get   '/tags'  =>  'prototypes#tags'       #tag一覧画面
end
