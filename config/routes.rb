Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  root 'welcome#index'

  get 'regulamento', to: 'welcome#regulamento', as: 'regulamento'
  get 'premios', to: 'welcome#premios', as: 'premios'
  get 'ranking', to: 'welcome#ranking', as: 'ranking'

  end
