Rails.application.routes.draw do
  root 'messages#index'
  devise_for :users
  resources :groups, except: [:destroy, :show]
end
