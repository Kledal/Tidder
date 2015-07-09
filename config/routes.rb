Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :subtidders do
    resources :posts do
      resources :comments
      put 'upvote', on: :member
      put 'downvote', on: :member
    end
  end

  resources :comments do
    put 'upvote', on: :member
    put 'downvote', on: :member
    resources :comments
  end

  root 'home#frontpage'

end
