Rails.application.routes.draw do
  resources :commetms
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
    collection do
      get :search
    end
  end

  resources :microposts , only: [:show, :create, :destroy ] do
        resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  

end