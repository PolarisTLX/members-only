Rails.application.routes.draw do
  #route
  # get 'sessions/new'
  root 'posts#index'
  # this root is the homepage, which is where all the posts are shown.  #index is an method/action in post_controller

  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users,   only: [:new, :create, :show, :edit, :update]
  resources :posts,   only: [:new, :create, :index]
end
