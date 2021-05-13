Rails.application.routes.draw do
  get 'chats/show'
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users, controllers: { registrations: "users/registrations" }
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
=begin
resorceを単数形にすると、そのコントローラのidがリクエストに含まれなくなる。
この場合、favariteのshowやindexページが存在しないため、これで機能する。
=end
  end
  
  get '/search' => 'search#search'
  
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create, :destroy]
  
=begin
    
    下記のようにルーティングをnamespaceでネストしてURLを分岐させることができる。
       namespace :admin do
        resources :items
       end
=end

end