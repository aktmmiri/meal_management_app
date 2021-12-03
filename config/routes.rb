Rails.application.routes.draw do
  devise_for :users
  root to: "meals#index"
  resources :meals, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
end
