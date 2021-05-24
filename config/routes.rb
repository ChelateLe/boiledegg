Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  post '/posts/:post_id/likes' => "likes#create"
  delete '/posts/:post_id/likes' => "likes#destroy"
  post '/collabos/:collabo_id/likes' => "likes#create"
  delete '/collabos/:collabo_id/likes' => "likes#destroy"

  devise_for :users

  resources :users 
  resources :posts do
    resources :comments, only: :create
  end
  resources :messages, only: :create
  resources :rooms, only: [:create, :show, :index]
  resources :collabos do
    resources :c_comments, only: :create
  end
end
