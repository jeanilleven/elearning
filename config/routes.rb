Rails.application.routes.draw do

  namespace :admin do
    get '/home', to: 'static_pages#home'
    resources :users, only: [ :index, :update ]

    resources :categories do
      resources :words
    end
  end

  #static pages
  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

  #user pages
  get 'signup', to: 'users#new'
  resources :users

  #lesson and answer pages
  resources :lessons, only: [ :new, :create, :show, :index ] do
    resources :answers, only: [ :new, :index, :show, :create ]
  end
  get '/categories', to: 'lessons#index'
  
  #session pages
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  #For the follow and unfollow function
  resources :relationships, only: [:create, :destroy]

end
