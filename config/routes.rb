Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
  }

  devise_scope :user do
    get 'users/tell' => 'users/registrations#tell'

    get 'users/address' => 'users/registrations#address'
    get 'users/index' => 'users/registrations#index'
    get 'users/card' => 'users/registrations#card'
  end

  root 'items#index'
  resources :items, only: [:index, :show, :new]
  resources :cards, only: :index
  resources :users, only:[:show] do
    collection do
      get :profile
      get :identification
    end
  end
end

  

