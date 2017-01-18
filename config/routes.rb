Rails.application.routes.draw do

  devise_for :users, controllers: {
      registrations: 'users/registrations',
  }

  resources :groups do
    resources :posts do
      resources :audios
      resources :videos
      resources :photos
      resources :likes
    end
    resources :audios
    resources :videos
    resources :photos
  end

  resources :users do
    resources :posts do
      resources :audios
      resources :videos
      resources :photos
      resources :likes
    end
    resources :audios
    resources :videos
    resources :photos do
      resources :likes
    end
  end

  resources :home
  resources :message do
    resources :audios
    resources :videos
    resources :photos
  end


  root to: 'home#index'

end
