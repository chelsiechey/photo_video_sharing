Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts
  post "posts/store"
  # same as
  # get 'profile', action: :show, controller: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

