Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  get 'users/profile' => 'users#profile'
  resources :items, only: [:index]
  resources :users, only:[:show]
end
