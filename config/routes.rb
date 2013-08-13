Analizate::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root 'welcome#index'

  match "/users" => "users#index", :via => :get
  match "/users/new" => "users#new", :via => :get
  match "/users/profile/1" => "users#profile", :via => :get

  match "/analysis" => "analysis#index", :via => :get
  match "/analysis/new" => "analysis#new", :via => :get
end
