Rails.application.routes.draw do
  resources :assignments
  root to: 'assignments#new'
end

