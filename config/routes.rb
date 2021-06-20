Rails.application.routes.draw do
  root 'tops#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy] do
    get :favorites, on: :collection
  end
  resources :posts, expect: [:index] 
  resources :posts do
    resources :comments
  end
  resources :favorites
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
end