Rails.application.routes.draw do
  devise_for :users

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    # 瀏覽所有餐廳的最新動態
    collection do
      get :feeds
      get :ranking
    end

    # 瀏覽個別餐廳的 Dashboard
    member do
      get :dashboard
    end

    member do
      post :favorite
      post :unfavorite
    end

    member do
      post :like
      post :unlike
    end

    member do
      post :friend
      post :unfriend
    end

    

  end


  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :friend_list
    end
  end

  resources :followships, only: [:create, :destroy]
  
  resources :friendships, only: [:create, :destroy]
  
  resources :categories, only: :show
	root "restaurants#index"
	
	namespace :admin do
		resources :restaurants
    resources :categories
    root "restaurants#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
