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
    get 'users/completion' => 'users/registrations#completion'
  end

  root 'items#index'

  resources :items do
    collection do
      get :search
    end
    member do
      get :buy
    end
  end
  
  resources :cards, only: [:index, :new]
  
  resources :users, only:[:show] do
    collection do
      get :profile
      get :identification
      get :logout
    end
  end
end

  

