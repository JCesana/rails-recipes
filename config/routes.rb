Rails.application.routes.draw do

  root 'recipes#index'

  get 'recipes/most_active',                to: 'recipes#active'
  get 'recipes/most_ingredients',           to: 'recipes#most_ingredients'
  get 'recipes/least_ingredients',          to: 'recipes#least_ingredients'
  get 'recipes/by_ingredient/:ingredient',  to: 'recipes#by_ingredient'

  resources :recipes do
    resources :comments, only: [:show, :create]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
