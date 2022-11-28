Rails.application.routes.draw do
  get 'records/index'
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  resources :categories, only: [:index, :create, :destroy, :show, :new] do
    resources :records, only: [:index, :create, :destroy, :show, :new]
  end
end
