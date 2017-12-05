Rails.application.routes.draw do
  devise_for :users
	root "restaurants#index"
	
	namespace :admin do
		resources :restaurants
    root "restaurants#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
