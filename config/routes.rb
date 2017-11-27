Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/admins/new', to: 'admins#new'
  get '/admins/new', to: 'admins#login'
  get '/users/new', to: 'user#new'
  get '/users/login', to:'users#login'
end