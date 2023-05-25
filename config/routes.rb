Rails.application.routes.draw do

  resources :tasks

  #get "/tasks", to: "tasks#index"
  post "/authenticate", to: "auth#authenticate" #Placeholder for auth/login page
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
