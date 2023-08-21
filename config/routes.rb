Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/_user'
  get 'users/_bio'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
