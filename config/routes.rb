Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :jobs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard" , to:"pages#dashboard"
  # Defines the root path route ("/")
  # root "posts#index"
  resources :jobs, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get :my_jobs
    end
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :update] do
    resources :reviews, only: [:new, :create]
  end
end
