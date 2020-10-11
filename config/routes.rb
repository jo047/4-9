Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  root to:"home#top"
  resources :users
  resources :books
end

