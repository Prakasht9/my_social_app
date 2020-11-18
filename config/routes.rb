Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  resources :posts, only: [:index, :show]

  resources :users, only: [:show, :edit, :update] do
    resources :posts, except: [:show], controller: 'users/posts'
  end

  resources :posts, only: [] do
    resources :comments, except: [:index, :show]
  end

  resources :likes, only: [:new, :destroy]
end
