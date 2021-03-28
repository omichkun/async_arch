Rails.application.routes.draw do
  root to: redirect('/tasks')
  get '/logout' => 'main#logout', as: :logout

  get '/auth/:provider/callback' => 'main#callback'
  resources :tasks, except: [:delete, :edit, :update] do
    post :close, on: :member
    collection do
      get :all
      post :assign_all
    end
  end
  resources :users, except: [:delete]

  get 'login' => 'main#login', as: :login
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end