Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]
  resources :follows, only: [:index, :create,:destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
