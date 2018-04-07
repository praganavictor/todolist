Rails.application.routes.draw do
  devise_for :users 

  root to: 'home#index'

  resources :lists do
  	resources :task
  end 
end
