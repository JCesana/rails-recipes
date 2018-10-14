Rails.application.routes.draw do

  root 'recipes#index'

  get 'recipes/most_active',  to: 'recipes#active'
  get 'recipes/hardest',      to: 'recipes#hardest'
  get 'recipes/easiest',      to: 'recipes#easiest'

  get 'by_ingredient',       to: 'ingredients#show'

  resources :recipes do
    resources :comments, only: [:index, :show, :create]
  end

  resources :ingredients, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
