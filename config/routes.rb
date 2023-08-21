Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/_post'
  get 'posts/_full'
  get 'posts/_comment'
  get 'users/index'
  get 'users/show'
  get 'users/_user'
  get 'users/_bio'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
