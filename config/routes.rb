Rails.application.routes.draw do

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :audio

  resources :video

  resources :message

  resources :post

  resources :photo

  resources :profile

  resources :home

  resources :like

  root to: 'home#index'

end
