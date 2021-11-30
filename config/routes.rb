Rails.application.routes.draw do
  devise_for :users
  root to: "meals#index"
  resources :meals, only: [:new, :create, :show, :edit, :update]
end
