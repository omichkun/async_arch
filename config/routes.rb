Rails.application.routes.draw do
  resources :tasks, except: [:delete, :edit, :update] do
    get :all, on: :collection
    post :assign_all, on: :collection
  end
  resources :users, except: [:delete]

  root to: 'main#index'
  get 'login/:id' => 'main#login', as: :login
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end