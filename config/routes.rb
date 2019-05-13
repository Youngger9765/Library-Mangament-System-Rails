Rails.application.routes.draw do
  namespace :admin do
    resources :posts
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :admins
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

  # get '/users/auth/google_oauth2/callback', to: 'users/omniauth_callbacks#google_oauth2'

  # resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/admins/new', to: 'admins#new'
  get '/admins/new', to: 'admins#login'
  get '/users/new', to: 'users#new'
  get '/users/login', to:'users#login'
  # patch '/issue/:id', to: "books#issue",as: 'issue'
  get '/return', to: 'books#return'
  patch '/return', to: "books#return"
  # authenticated :user do
  #   root 'users#main', as: :authenticated_root
  # end
  # authenticated :admin do
  #   root 'admins#main', as: :authenticated_root
  # end
  get '/users/main', to: 'users#main'
  # get '/books/show', to: 'books#show'
  # get '/books/issue', to: 'books#issue'
  # get '/admins/main', to: 'admins#main'
  # get '/books/new', to:"books#new", as: "new_book"
  # post '/books', to: "books#create" , as: "books"
  # patch '/delete', to: "books#delete"
  # get '/books/deleteshow', to: "books#deleteshow"
  # get '/books/delete', to: 'books#delete'

  resources :books do
    get :create_comment
    get :delete_comment
    get :add_book_img_url
    patch :issue
  end

  # match ':controller(/:action(/:id(.:format)))', :via => :all
end