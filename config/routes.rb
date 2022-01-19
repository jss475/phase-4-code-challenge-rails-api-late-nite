Rails.application.routes.draw do
  resources :episode_guests
  resources :appearances, only: [:create]
  resources :episodes, only: [:index, :show, :destroy]
  resources :guests, only: [:index]
end
