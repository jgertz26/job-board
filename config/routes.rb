Rails.application.routes.draw do
  root 'jobs#index'
  devise_for :users

  resources :jobs, except: [:edit, :update, :destroy]
end
