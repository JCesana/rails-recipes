Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes do
    post 'comments', to: 'comments#create'
  end

  root 'recipes#index'
end
