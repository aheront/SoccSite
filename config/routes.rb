Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }


  resources :home

  root to: 'home#index'

end
