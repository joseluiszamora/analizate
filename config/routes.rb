Analizate::Application.routes.draw do

  resources :specialties

  resources :analyses do
    get 'patients', on: :collection
    get 'medical', on: :collection
    get 'tests', on: :collection
  end

  #resources :analyzes, only: [:index, :new] do
  #  get 'patients', on: :collection
  #  get 'medical', on: :collection
  #end

  resources :users, only: [:index, :new, :create, :edit, :destroy, :update] do
    get 'profile', on: :member
  end
  get '/doctors' => 'users#doctors', as: :doctors

  resources :home

  resources :notices

  resources :tests

  resources :institutions do
    get "hospitals", on: :collection
    get "pharms", on: :collection
  end

  resources :test_categories

  devise_for :users, controllers: { sessions: 'sessions' }, skip: [ :sessions ]
  as :user do
    get '/login' => 'sessions#new', as: :new_user_session
    post '/login' => 'sessions#create', as: :user_session
    delete '/logout' => 'sessions#destroy', as: :destroy_user_session
  end


  root 'home#index'

end
