Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      root to: 'pages#home'
      resources :users, only: [ :index, :destroy ]
    end
  end
end
