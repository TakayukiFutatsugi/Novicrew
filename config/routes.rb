Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'jobs#index'
  
  resources :articles
  resources :jobs
  
  devise_for :clients, controllers: {
    sessions: 'clients/sessions',
    passwords: 'clients/passwords',
    registrations: 'clients/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get 'home', to: 'clients#home'
  resources :clients, only:[:index, :show]
  
  resources :users, only:[:index, :show] do
    resources :scouts, only:[:show, :create]
  end
  resources :scouts, only:[:index]
  
  resources :jobs do
    resources :entries, only:[:show, :create]
  end
  resources :entries, only:[:index]
  
  resources :rooms, only:[:index, :show, :create] do
    resources :messages, only:[:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
