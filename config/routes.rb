Rails.application.routes.draw do

  resources :recipes do
    resources :comments, only: [:show, :create]
    # post 'commments', to: 'comments#create'
  end

  root 'recipes#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
