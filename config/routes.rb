Rails.application.routes.draw do
  resources :users do
    resources :goals, only: [:create, :destroy, :edit, :update]
  end
  resource :session, only: [:new, :create, :destroy]
  end
