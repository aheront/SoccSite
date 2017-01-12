Rails.application.routes.draw do


  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :photo

  resources :profile

  resources :home

  root to: 'home#index'

end
