Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
    member do
      post 'downvote'
      post 'upvote'
    end
  end
  resources :subs, except: [:destroy]
  resources :comments, only: [:show, :create] do
    member do
      post 'upvote'
      post 'downvote'
    end
  end


end
