Analizate::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root 'welcome#index'

  #match "user" => "users#index", :as => 'home'
  match "/users" => "users#index", :via => :get
  match "/users/new" => "users#new", :via => :get
  match "/users/profile/1" => "users#profile", :via => :get
  #match "/send_email" => "welcome#send_email"
  #match ":locale/service" => "service#index", :via => :get, as: :service_index
  #match ":locale/service/:id" => "service#show", :via => :get
  #match ":locale/eventhall" => "eventhall#index", :via => :get, as: :eventhall_index
end
