Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :bugs
  resources :contacts
  resources :questions do
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
    resources :answers
  end

  devise_for :users

  get 'team', to: 'users#team', as: :team
  get 'profile/:id', to: 'users#profile', as: :profile
  
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end

  root to: 'questions#index'

end
