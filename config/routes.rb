Rails.application.routes.draw do
  resources :projects
  resources :users, only: [:create, :index, :show, :update, :destroy]
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'

  put '/users', to: 'users#update'

  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
