Rails.application.routes.draw do
  
  resources :contacts
  resources :questions do
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
    resources :answers
  end

  devise_for :users
  
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  root to: 'questions#index'

end
