require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      root to: 'pages#home'
      resources :users, only: [:index, :destroy]
      resources :contrats, only: [:create] do
        resources :contrat_clients, only: [:index, :show, :create, :update]
      end
    end
  end

  # Sidekiq Web UI, only for admins.
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
