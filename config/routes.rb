Analizate::Application.routes.draw do
  resources :controllers

  resources :institutions

  resources :analyses do
    get 'patients', on: :collection
    get 'medical', on: :collection
    get 'tests', on: :collection
  end

  resources :notices

  #resources :analyzes, only: [:index, :new] do
  #  get 'patients', on: :collection
  #  get 'medical', on: :collection
  #end

  resources :users, only: [:index, :new, :create] do
    get 'profile', on: :member
  end

  resources :tests

  resources :test_categories

  devise_for :users, controllers: { sessions: 'sessions' }

  root 'users#index'

end
