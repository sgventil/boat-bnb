Rails.application.routes.draw do
  root to: "boats#index"
  devise_for :users, controllers: {
     sessions: 'users/sessions',
     omniauth_callbacks: 'users/omniauth_callbacks'
   }

   devise_scope :user do
    get '/users/auth/google_oauth2/callback', to: 'users/omniauth_callbacks#google_oauth2', as: 'user_google_oauth2_omniauth_callback'
  end

  get 'boats/map_view', to: 'boats#map_view', as: 'boats_map_view'

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
