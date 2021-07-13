Rails.application.routes.draw do
  get "/" => "home#index"

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  resources :todos

  resources :users
  post "users/login", to: "users#login"
end
