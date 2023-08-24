Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: {
     sessions: 'users/omniauth_callbacks/sessions',
     omniauth_callbacks: 'users/omniauth_callbacks/omniauth_callbacks'
   }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :boats
end
