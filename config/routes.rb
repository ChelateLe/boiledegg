Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  devise_for :users
  resources :users 
  resources :posts 
  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]
end
