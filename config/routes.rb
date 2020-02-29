# frozen_string_literal: true

Rails.application.routes.draw do
  get 'maps/map'
  get 'users/show'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }
  root to: 'shops#index'
  resources :shops do
    resources :comments, only: %i[create destroy] do
      resources :likes, only: %i[create destroy]
    end
  end
  resources :users
end
