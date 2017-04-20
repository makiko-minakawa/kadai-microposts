Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      #↓追加分
      get :favorites
    end
    collection do
      get :search
    end
  end
  
#   resources :users, only: [:index, :show] do
#     member do
# 	   get :favorites
# 	  end
# 	  collection do
# 	    get :search
# 	  end
# 	end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  #resource :favorites, only: [:create, :destroy]
  #下記に書き換え
  resources :favorites, only: [:create, :destroy]
	
end