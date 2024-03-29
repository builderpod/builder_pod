require 'sidekiq/web'

Rails.application.routes.draw do
  use_doorkeeper
  resources :tasks
  resources :bids
  resources :contractors do 
    resources :tasks
  end



  resources :task_profiles 

  resources :categories do 
    resources :task_profiles
  end

  resources :projects do
    get :avatar, on: :member
    resources :tasks
  end

  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: "users#index"
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
