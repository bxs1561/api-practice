Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get '/sign-up', to: 'users#signup'
  post '/sign-up', to: 'users#create'
  get '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  get '/song', to:'apis#index'
  get '/artist', to: 'artists#index'
  get '/search', to: 'songs#index', as: 'search_artist'

  post '/search', to: 'songs#index', as: 'search_artist_post'
  get '/money', to: 'currencies#index'



  root 'homes#home'
end
