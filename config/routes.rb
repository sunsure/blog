Blog::Application.routes.draw do

  match :dashboard, to: "dashboard#index", via: [:get]
  resources :articles
  root 'articles#index'

end
