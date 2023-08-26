Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: {
     sessions: 'users/omniauth_callbacks/sessions',
     omniauth_callbacks: 'users/omniauth_callbacks/omniauth_callbacks'
   }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    member do
      get 'my_boats', to: 'boats#my_boats'
    end
    resources :bookings, only: [:index]
  end

  resources :boats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:index]
  end

  resources :bookings do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]

  resources :bookings, only: [:show, :destroy, :edit, :update]
end
