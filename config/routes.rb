Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      root to: 'pages#home'
      # resources :contract, only: [ :index ]
    end
  end
end
