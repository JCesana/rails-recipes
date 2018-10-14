Rails.application.routes.draw do

  get 'users/index'
  get 'users/top_contributors'
  root 'recipes#index'

  get 'recipes/most_active',    to: 'recipes#active'
  get 'recipes/hardest',        to: 'recipes#hardest'
  get 'recipes/easiest',        to: 'recipes#easiest'

  get 'users/top_contributors',  to: 'users#top_contributors', as: 'top_contributors'

  get 'by_ingredient',          to: 'ingredients#show'

  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index]
  end

  resources :recipes do
    resources :comments, only: [:index, :create]
  end

  resources :ingredients, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :path => 'u'

end
