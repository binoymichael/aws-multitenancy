Rails.application.routes.draw do
  devise_for :users
  resources :assignments
  root to: 'assignments#new'
end

