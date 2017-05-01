Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :groups, except: [:destroy, :show] do
    resources :messages, only: [:index, :new, :create]
  end
end
