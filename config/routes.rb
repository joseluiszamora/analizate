Analizate::Application.routes.draw do
  resources :users, only: [:index, :new, :create] do
    get 'profile', on: :member
  end

  resources :tests

  resources :test_categories

  devise_for :users, controllers: { sessions: 'sessions' }

  root 'welcome#index'

  match "/analysis" => "analysis#index", :via => :get
  match "/analysis/new" => "analysis#new", :via => :get
end
