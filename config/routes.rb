Rails.application.routes.draw do
  root to: "home#index"
  resources :teams
  devise_for :users
  post '/team_users(.:format)', to: 'team_users#create', as: :team_users
  delete '/team_users(.:format)', to: 'team_users#destroy', as: :team_user
end
