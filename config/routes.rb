Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/calendar', to: 'calendar#index', as: 'calendar'
  root to: "home#index"
  resources :categories do
    resources :tasks, shallow: true
    end
  end
