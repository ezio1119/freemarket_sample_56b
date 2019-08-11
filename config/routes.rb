Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  get 'users/profile' => 'users#profile'
  get 'users/identification' => 'users#identification'
  resources :items, only: [:index, :show, :new] do
    member do
      get :buy
    end
  end
  resources :users, only:[:show, :index]
  resources :cards, only: :index
end