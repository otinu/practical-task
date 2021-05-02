Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  devise_for :books
  resources :users,only: [:show,:index,:edit,:update]
  
  resources :users do
    member do
      get :follows, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  patch 'users_path' => 'users#show'
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  get '/search' => 'search#search'
end