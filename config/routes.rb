Rails.application.routes.draw do
  resources :tasks
  resources :projects do
    post 'add_task', on: :member
  end
  resources :users


end
