Witly::Application.routes.draw do
 resources :go, :users, :sessions

  get '/signup' => 'users#new'
  delete '/signout', to: 'sessions#destroy'
  get'/signin' => 'sessions#new'

  get "sessions/new"
  get "sessions/destroy"
  get "users/new"
  get "users/show"
  get "users/create"
  #hosts input form

 
  root to: 'go#new' # get's a new Url model  

  get "go/index", to: "go#index", as: :all # loads all Urls

  post "/", to: "go#create", as: :urls # this creates the instance from input form

  get "go/edit/:id", to: "go#edit" #as: :edit

  put "go/:id", to: "go#update", as: :link_update

  get "go/:id", to: "go#show", as: :new_url #shows the new url

  delete "go/:id", to: "go#destroy", as: :destroy


end

