Rails.application.routes.draw do
  resources :minesweepers, only: [:new, :create, :show, :index, :update] do
    get :minecheck, on: :member
    get :restart, on: :member
  end
  root "minesweepers#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
