Rails.application.routes.draw do
  root 'home#show'

  # Auth
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout' => 'logout#logout'


  resources :registered_talks
  resources :talks
  resources :conferences
  get 'dashboard' => 'dashboard#show'
  scope ":event" do
    post 'auth/auth0' => redirect('/auth/auth0')
    resources :profiles
    get 'registration' => 'profiles#new'
    get '/' => 'event#show'
  end
end

