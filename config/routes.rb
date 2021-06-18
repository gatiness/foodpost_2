Rails.application.routes.draw do
  root 'tops#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :posts 
  resources :favorites, only: [:create, :destroy]
  resources :posts do
    resources :comments
  end
  
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
end
