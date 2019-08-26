Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    post 'users/put_in' => 'users/registrations#put_in'
    get 'users/index' => 'users/registrations#index'
  end
  

  root 'items#index'

  resources :items do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get :search
    end
    member do
      get :buy
    end
  end
  
  namespace :users do
    resources :cards, only: [:create, :index, :destroy, :new] do
      collection do
        get :register
        post :register_create
      end
      member do
        get :change
      end
    end
    resources :phone_auth, only: [:index] do
      collection do
        post :send_sms
        post :conf_num
      end
    end
    resources :addresses, only: [:index, :create] 
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :destroy] do
    resource :order, only: [:new, :create] do
      collection do
        get :change
      end
    end
  end

  resources :users, only: :show do
    member do
      get :profile
      get :identification
      get :items_list
      get :logout
      get :favorites_list
    end
    collection do
      resources :orders, only: [:index, :show] do
        collection do
          get :bought
          get :sold
        end
      end
    end
  end

  resources :categories, only: [:index, :show] do
    collection do
      get :search_children
    end
  end
  
  get 'sizes/shoes_size', to: 'sizes#shoes_size'
  get 'sizes/clothes_size', to: 'sizes#clothes_size'
end
