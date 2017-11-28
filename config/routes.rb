Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/admins/new', to: 'admins#new'
  get '/admins/new', to: 'admins#login'
  get '/users/new', to: 'users#new'
  get '/users/login', to:'users#login'
  patch '/issue/:id', to: "books#issue",as: 'issue'
  get '/return', to: 'books#return'
  patch '/return', to: "books#return"
  #authenticated :user do
  #  root 'users#main', as: :authenticated_root
  #end
  #authenticated :admins do
  #  root 'admins#main'
    #as: :authenticated_root
  #end
  get '/books/show', to: 'books#show'
  get '/books/issue', to: 'books#issue'
  get '/users/main', to: 'users#main'
  get '/admins/main', to: 'admins#main'
  get '/books/new', to:"books#new", as: "new_book"
  post '/books', to: "books#create" , as: "books"
  patch '/delete', to: "books#delete"
  get '/books/delete', to: 'books#delete'
end