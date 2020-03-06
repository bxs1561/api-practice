Rails.application.routes.draw do
  # devise_for :users
  # devise_for :users, path_names: {
  #     sign_in: 'login',
  #     sign_out: 'logout',
  #     password: 'secret',
  #     sign_up: 'signup'
  # }
  # mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  # devise_for :users
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  resources :songs
  resources :musics
  resources :audios
  resources :videos
  # resources :sessions
  #
  # get '/sign-up', to: 'users#signup'
  # post '/sign-up', to: 'users#create'
  # get '/login', to: 'sessions#login'
  # get '/logout', to: 'sessions#destroy'
  # post '/login', to: 'sessions#create'
  get '/song', to:'apis#index'
  # #   get '/song/:search', to:'apis#index'
  get '/artist', to: 'artists#index'
  get '/search', to: 'songs#index', as: 'search_song'
  post '/search', to: 'songs#search', as: 'search_song_post'
  get '/soccer-search', to: 'soccers#index'
  post '/soccer-search', to: 'soccers#search'
  get '/video', to: 'videos#video'
  get '/audio', to: 'audios#audio'
  # # get '/videos', to: 'videos#index'
  get '/video-search', to: 'videos#search'
  post '/video-search', to: 'videos#search_result'
  #
  #
  # # post '/video', to: 'musics#create'
  #
  #
  #
  #
  # # post '/search', to: 'songs#index', as: 'search_artist_post'
  #
  get '/money', to: 'currencies#index'
  # # get '/search' => 'pages#index', :as => 'search_page'
  # # post '/search' => 'pages#search', :as => 'search_page_post'
  #
  #
  root 'homes#home'
end
