Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  devise_for :users
  resources :users 
  resources :posts do
    resources :comments, only: :create
  end
  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]
  resources :collabos 
end
