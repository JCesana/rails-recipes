Rails.application.routes.draw do

  root 'recipes#index'

  get 'recipes/most_active',    to: 'recipes#active'
  get 'recipes/hardest',        to: 'recipes#hardest'
  get 'recipes/easiest',        to: 'recipes#easiest'

  get 'recipes/:id/next',       to: 'recipes#next'
  get 'recipes/:id/previous',   to: 'recipes#previous'

  get 'by_ingredient',          to: 'ingredients#show'

  get 'users/top_contributors', to: 'users#top_contributors', as: 'top_contributors'

  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :new]
    get 'user_comments', to: 'comments#user_comments'
  end

  resources :recipes do
    resources :comments, only: [:index, :create]
  end

  resources :ingredients, only: [:index, :show]

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, :path => 'u'

end
