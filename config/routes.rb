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
    resources :bookings, only: [:index]
  end

  resources :boats do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings do
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :boats, only: [:index, :show, :destroy]

  resources :booking, only: [:show, :destroy]
end
