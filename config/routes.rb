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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
