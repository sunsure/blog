Blog::Application.routes.draw do

  devise_for :users, path: "u", path_names: { sign_in: 'login', sign_out: 'logout', confirmation: 'confirm', registration: 'register', sign_up: 'new' }, controllers: { registrations: "registrations" }

  match :dashboard, to: "dashboard#index", via: [:get]
  resources :articles
  resources :users

  root 'articles#index'

end
