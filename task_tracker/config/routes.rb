Rails.application.routes.draw do
  resources :tasks, except: [:delete, :edit, :update] do
    post :close, on: :member
    collection do
      get :all
      post :assign_all
    end
  end
  resources :users, except: [:delete]

  root to: 'main#index'
  get 'login/:id' => 'main#login', as: :login
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end