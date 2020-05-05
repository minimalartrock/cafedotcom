# frozen_string_literal: true

Rails.application.routes.draw do
  get "search/location"
  get "search/outret"
  get "search/wifi"
  get "search/smoking"
  namespace :admin, only: %i[new edit update index create destroy] do
    resources :shops
  end
  namespace :admin, only: %i[edit update index destroy] do
    resources :users
  end
  get "errors/show"
  get "maps/map"
  devise_for :users, controllers: {
                       omniauth_callbacks: "users/omniauth_callbacks",
                       registrations: "users/registrations",
                     }
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    post "login", to: "devise/sessions#create"
    delete "logout", to: "devise/sessions#destroy"
    post "users/guest_sign_in", to: "users/sessions#new_guest"
  end
  root to: "shops#index"
  resources :shops, only: %i[index show] do
    resources :comments, only: %i[create destroy] do
      resources :likes, only: %i[create destroy]
    end
    post "favorite", to: "favorites#create"
    delete "/favorite", to: "favorites#destroy"
    post "congestion", to: "congestions#create"
    delete "/congestion", to: "congestions#destroy"
  end
  resources :users, only: %i[show] do
    get "favorites", to: "favorites#index"
  end
end
