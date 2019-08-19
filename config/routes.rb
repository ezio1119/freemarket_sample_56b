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
  

  namespace :users do
    resources :cards, only: [:create, :index, :destroy, :new] do
      collection do
        get :register
      end
      member do
        get :change
      end
    end
    resources :addresses, only: [:index, :create] 
  end

  resources :items, only: [:index, :show, :new, :create, :edit, :destroy] do
    resource :order, only: [:new, :show, :create] do
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
    end
  end
  get 'categories/search_children', to: 'categories#search_children'
  
end

  

