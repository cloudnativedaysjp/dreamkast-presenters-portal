Rails.application.routes.draw do
  root 'home#show'

  # Auth
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout' => 'logout#logout'

  resources :registered_talks
  resources :talks
  resources :conferences, param: :abbr
  scope ":event" do
    get 'dashboard' => 'dashboard#show'
    post 'auth/auth0' => redirect('/auth/auth0')
    resources :speakers, only: [:new, :show, :edit, :update, :create]
    get 'registration' => 'speakers#new'
    get '/' => 'event#show'
  end
end

