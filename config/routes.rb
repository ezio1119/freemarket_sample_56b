Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
  }

  devise_scope :user do
    get 'users/address' => 'users/registrations#address'
    get 'users/index' => 'users/registrations#index'
  end

  root 'items#index'
  get 'users/profile' => 'users#profile'

  resources :items, only: [:index, :show, :new]
  resources :users, only:[:show, :index]
end

