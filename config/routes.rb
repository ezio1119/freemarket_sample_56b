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
  resources :items, only: [:index, :show]
  resources :users, only:[:show]

end

