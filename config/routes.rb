Rails.application.routes.draw do
  root "dashboard#show"

  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
