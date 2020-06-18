Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :identities, only: [:destroy]
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  root to: 'pages#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
  resources :follows, only: [:index, :create, :destroy, :update], path: "dashboard"
  get "dashboard/sorted_collection", to: "follows#sorted_collection"
  post "dashboard/dlive", to: "follows#dlive"
  post "dashboard/smashcast", to: "follows#smashcast"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :follows, only: [ :index ]
    end
  end
end
