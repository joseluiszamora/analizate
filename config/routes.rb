Analizate::Application.routes.draw do
  resources :users, only: [:index, :show, :new, :create]

  resources :tests

  resources :test_categories

  devise_for :users, controllers: { sessions: 'sessions' }

  root 'welcome#index'

  match "/users/profile/1" => "users#profile", :via => :get

  match "/analysis" => "analysis#index", :via => :get
  match "/analysis/new" => "analysis#new", :via => :get
end
