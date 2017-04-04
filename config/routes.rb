Rails.application.routes.draw do

  root 'auctions#index'


  # get "auctions/:id/published" => "auctions#published"
  # get "auctions/:id/canceled" => "auctions#canceled"

  namespace :admin do
    resources :dashboard, only: [:index]
  end

  delete     '/logout'        =>  'sessions#destroy'
  get 'users/profile'   => 'users#show'

  resources :bids, only: [:edit, :update]
  resources :auctions
  resources :auctions do
    resources :bids, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :edit] do
    delete :destroy, on: :collection
  end
end
