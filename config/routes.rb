Rails.application.routes.draw do

  devise_for :users, controllers: {
      registrations: 'users/registrations',
  }

  resources :groups do
    resources :posts do
      resources :audios
      resources :videos
      resources :photos
      get :like, on: :member
      get :dislike, on: :member
    end
    resources :audios
    resources :videos
    resources :photos do
      get :like, on: :member
      get :dislike, on: :member
    end
    post :new_avatar, on: :member
  end

  resources :users do
    resources :dialogs do
      resources :messages do
        resources :photos
      end
    end
    resources :posts do
      resources :photos
      get :like, on: :member
      get :dislike, on: :member
    end
    post :new_avatar, on: :member
    get  :request_friend_index, on: :collection
    get  :all_people, on: :collection
    post :friend_new, on: :member
    delete :friend_del, on: :member
    resources :audios
    resources :videos
    resources :photos do
      post :edit_avatar, on: :member
      get :like, on: :member
      get :dislike, on: :member
    end
  end

  resources :home




  root to: 'home#index'

end
