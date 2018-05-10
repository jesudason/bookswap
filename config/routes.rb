Rails.application.routes.draw do

  post 'users/:id', to: 'users#show'
  get '/users/index', to: 'pages#index'

  resources :wishlists
  resources :mybooks
  resources :books
  resources :users
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'pages#index'
  get '/login', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'
  get '/api/mapmarkers', to: 'pages#map_markers'
  get '/viewmaps', to: 'pages#view_map'
  get '/style', to: 'pages#style'

  get '/login', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'
  get '/api/books', to: 'books#list_of_books'

end
