Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  resources :items, only: [:index, :show, :new]
  resources :users, only:[:show, :index]
end

