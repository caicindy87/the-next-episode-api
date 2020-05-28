Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :shows, only: [:index, :show]
      resources :saved_shows, only: [:index, :create, :show, :update, :destroy]
      resources :reviews, only: [:create, :show, :update, :destroy]
      resources :users, only: [:create]
      get "/search", to: "searches#get_shows"
      # routes for auth
      post "/auth", to: "auth#create"
      get "/current_user", to: "auth#show"
    end
  end
end
