Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :places
  resources :users
  resources :checkins
  resources :friendships

end
