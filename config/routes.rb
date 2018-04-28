Rails.application.routes.draw do
  get 'comments/:id/index', to: 'comments#index'
  post '/comments/create', to: 'comments#create', as: "comments"

  get 'favorites/index'

  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'

  resources 'users'
  resources 'topics'
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'
  # get '/comments/:id/index', to: 'comments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
