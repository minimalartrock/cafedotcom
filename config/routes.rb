# frozen_string_literal: true

Rails.application.routes.draw do
  get 'errors/show'
  get 'maps/map'
  get 'users/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  root to: 'shops#index'
  resources :shops do
    resources :comments, only: %i[create destroy] do
      resources :likes, only: %i[create destroy]
    end
  end
  resources :users
end
