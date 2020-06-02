Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :identities
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  root to: 'pages#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
  resources :follows, only: [:index, :create,:destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
