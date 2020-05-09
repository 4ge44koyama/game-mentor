Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'posts#index'
  namespace :posts do
    resources :searches
  end
  resources :users, only: [:show, :edit, :update] do
    resources :requests, only: :index
  end
  resources :requests, only: [:create, :update, :destroy]
  resources :posts, except: :index

end