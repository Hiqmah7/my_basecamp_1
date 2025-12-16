Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :destroy] do
    patch :set_admin
    patch :remove_admin
  end
  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy'
  resources :projects, only: [:new, :create, :show, :index, :edit, :update, :destroy]

  root "sessions#new"
end
