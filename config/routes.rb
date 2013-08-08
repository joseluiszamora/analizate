Analizate::Application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root 'welcome#index'
end
