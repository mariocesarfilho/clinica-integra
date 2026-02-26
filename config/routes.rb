Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      resources :therapists, only: [ :show, :update, :create, :destroy ]
      resources :sessions, only: [ :create ]
    end
  end
end
