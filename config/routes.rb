Analizate::Application.routes.draw do

  resources :analyses do
    get 'patients', on: :collection
    get 'medical', on: :collection
    get 'tests', on: :collection
  end

  #resources :analyzes, only: [:index, :new] do
  #  get 'patients', on: :collection
  #  get 'medical', on: :collection
  #end

  resources :users, only: [:index, :new, :create] do
    get 'profile', on: :member
  end

  resources :home

  resources :notices

  resources :tests

  resources :institutions do
    get "hospitals", on: :collection
    get "pharms", on: :collection
  end

  resources :test_categories

  devise_for :users, controllers: { sessions: 'sessions' }

  root 'home#index'

end