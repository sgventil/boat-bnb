Rails.application.routes.draw do
  root to: "boats#index"
  devise_for :users, controllers: {
     sessions: 'users/omniauth_callbacks/sessions',
     omniauth_callbacks: 'users/omniauth_callbacks/omniauth_callbacks'
   }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :users do
    member do
      get 'my_boats', to: 'boats#my_boats'
      get 'my_bookings', to: 'bookings#my_bookings'
    end
  end

  resources :boats do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:index]
  end

  resources :bookings, only: [:index, :show, :destroy, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
end
