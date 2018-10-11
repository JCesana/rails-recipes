Rails.application.routes.draw do

  root 'recipes#index'

  get 'recipes/most_active',       to: 'recipes#active'
  get 'recipes/hardest',  to: 'recipes#most_ingredients'
  get 'recipes/easiest', to: 'recipes#least_ingredients'

  resources :recipes do
    resources :comments, only: [:show, :create]
  end

  resources :ingredients do
    resources :recipes, only: [:index, :show]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
