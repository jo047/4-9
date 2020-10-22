Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  root to:"home#top"
  resources :users do
    get 'follows' => 'relationships#follows'
    get 'followers' => 'relationships#followers'
    # get :search, on: :collection
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す
  get '/search' => 'search#search'
end