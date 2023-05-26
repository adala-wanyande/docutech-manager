Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # user
  post '/users', to: 'users#register'
  post '/users/login', to: 'users#login'
  get '/users/login/check', to: 'users#show'
  delete '/users/logout', to: 'users#logout'


  # todo
  post '/todos', to: 'todos#create'
  put '/todos/:id', to: 'todos#update'
  get '/todos/:id', to: 'todos#show'
  delete '/todos/:id', to: 'todos#destroy'
  get '/todos', to: 'todos#index'

  # verify_auth
  get '/verify', to: 'application#verify_auth'
end
