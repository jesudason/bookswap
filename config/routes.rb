Rails.application.routes.draw do
  resources :wishlists
  resources :mybooks
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
