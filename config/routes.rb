Rails.application.routes.draw do

  #static pages
  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  #user pages
  get 'signup', to: 'users#new'
  resources :users
  
  #session pages
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  #For the follow and unfollow function
  resources :relationships, only: [:create, :destroy]

end
