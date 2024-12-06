Rails.application.routes.draw do
  resources :daily_reports
  devise_for :users
  resources :goals
  resources :tasks
  root to: 'goals#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
