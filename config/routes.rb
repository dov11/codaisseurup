Rails.application.routes.draw do
  resources :categories
  root to: 'pages#home'

  devise_for :users
  resources :users
  resources :events do
    resources :reservations, only: [:create]
  end
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos, only: [:destroy]
  get "about" => "pages#about"
  get "tc" => "pages#tc"
  get "categories" => "categories#show"

  namespace :api do
    resources :events do
      resources :reservations, only: [:create, :update, :destroy]
    end
  end
end
