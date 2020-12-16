Rails.application.routes.draw do
  root 'home#show'

  # Auth
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout' => 'logout#logout'

  resources :talks
  resources :conferences, param: :abbr
  scope ":event" do
    post 'auth/auth0' => redirect('/auth/auth0')
    get '/speakers/registration' => 'speakers#new'
    resources :speakers, only: [:new, :show, :edit, :update, :create]
    get '/' => 'event#show'
  end
end

