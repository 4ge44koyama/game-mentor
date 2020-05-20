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
  resources :users, only: %i[show edit update] do
    resources :requests, only: :index
    resources :messages, only: %i[index show]
    member do
      get 'mentor', to: 'users#mentor'
      get 'mentee', to: 'users#mentee'
    end
  end
  resources :requests, only: %i[create update destroy]
  resources :posts, except: :index
  resources :messages, only: :create
end
