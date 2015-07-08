Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :subtidders

  resources :posts do
    resources :comments
    put 'upvote', on: :member
    put 'downvote', on: :member
  end

  resources :comments, only: [:show, :destroy] do
    put 'upvote', on: :member
    put 'downvote', on: :member
    resources :comments
  end

  root 'home#frontpage'

end
