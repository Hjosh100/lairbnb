Rails.application.routes.draw do

  devise_for :users
  root to: "lairs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    resources :bookings, only: %i[index]
  end

  resources :lairs, only: %i[index show new create] do
    resources :bookings, except: %i[edit update] do
      collection do
        get :renter_index
      end
    end
  end

  patch "lair/:id/booking/:id", to: "bookings#confirm", as: "confirmation_booking"

  # Defines the root path route ("/")
  # root "posts#index"
end
