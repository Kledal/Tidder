Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :posts do
    put 'upvote', on: :member
    put 'downvote', on: :member
  end

  root 'home#frontpage'

end
