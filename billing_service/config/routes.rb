Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'stats#my'
  get '/logout' => 'sessions#logout', as: :logout
  get '/login' => 'sessions#login', as: :login
  get '/auth/:provider/callback' => 'sessions#callback'

  get 'my' => 'stats#my'
end
