Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  devise_for :users
  resources :users, only: :show
  resources :posts 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
