Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/:user_id/calendar', to: 'calendar#index', as: 'user_calendar'
  root to: "home#index"
  resources :users do
    resources :categories do
      resources :tasks
    end
  end
end
