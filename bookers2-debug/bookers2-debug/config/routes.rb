Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  devise_for :books
  resources :users,only: [:show,:index,:edit,:update]
  patch 'users_path' => 'users#show'
  resources :books
end