Rails.application.routes.draw do
	root "restaurants#index"
	
	namespace :admin do
    root "restaurants#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
