Gsd::Application.routes.draw do
  devise_for :users
  resources :users, :tasks
  root :to => 'home#index'
end