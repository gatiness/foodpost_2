Rails.application.routes.draw do
  root 'tops#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  # devise_for :users
  # resources :users, only: [:show, :edit, :update, :destroy] do
  #   get :favorites, on: :collection
  # end
  # resources :posts, expect: [:index] 
  # resources :posts do
  #   resources :comments
  # end
  # resources :favorites

  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts 
  resources :favorites, only: [:index, :create, :destroy]
  resources :posts do
    resources :comments
  end


  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
  post '/tops/admin_guest_sign_in', to: 'tops#admin_guest_sign_in'
end