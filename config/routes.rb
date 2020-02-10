Rails.application.routes.draw do
  get "users/show"
  devise_for :users, controllers: {
                       omniauth_callbacks: "users/omniauth_callbacks",
                       registrations: "registrations",
                     }
  root to: "shops#index"
  resources :shops do
    resources :comments, only: [:create, :destroy]
  end
  resources :users
end
