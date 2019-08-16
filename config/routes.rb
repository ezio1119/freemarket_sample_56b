Rails.application.routes.draw do
  root 'items#index'
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get 'users/tell' => 'users/registrations#tell'
    get 'users/index' => 'users/registrations#index'
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
  
  namespace :users do
    resource :cards, only: [:create, :new, :show, :destroy] do
      collection do
        get :register
      end
    end
    resources :addresses, only: [:index, :create] 
  end

  resources :items, only: [:index, :show, :new, :create] do
    resources :orders, only: [:index, :create]
  end

  resources :users, only: :show do
    member do
      get :profile
      get :identification
      get :items_list
      get :logout
    end
  end
  get 'categories/search_children', to: 'categories#search_children'
  
end

  

