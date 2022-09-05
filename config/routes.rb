Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:show,:index,:create,:edit,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resources :book_comments, only: [:create]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show,:index,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end