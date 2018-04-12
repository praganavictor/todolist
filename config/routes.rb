Rails.application.routes.draw do
  devise_for :users 

  root to: 'home#index'

  resources :lists do
	post 'publish', to: 'lists#publish'
	post 'privating', to: 'lists#privating'
	post 'unfavorite', to: 'lists#unfavorite'
	post 'favorite', to: 'lists#favorite'

  	resources :task 
  end 
end
