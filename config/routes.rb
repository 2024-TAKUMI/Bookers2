Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about", to: "homes#about" #(get "home/about" => "homes#about")
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show]
end