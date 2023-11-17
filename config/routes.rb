Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :experiences, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: :create
    resources :reviews, only: :create
  end

  resources :bookings, only: [:index, :show, :destroy] do
    resources :messages, only: :create
  end

  resources :reviews, only: :destroy

  namespace :host do
    resources :experiences, only: [:index, :destroy]
    resources :bookings, only: [:index, :update]
  end
end
