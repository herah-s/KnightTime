Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :experiences, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :bookings, only: [:index, :destroy]

  namespace :host do
    resources :bookings, only: [:index, :update]
  end
end
