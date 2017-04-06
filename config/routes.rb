Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  delete     '/logout'        =>  'sessions#destroy'
  get 'customers/profile'   => 'customers#show'

  resources :customers, only: [:new, :index, :create, :update, :show] do
  put :password
 end
  resources :passwords_resets, only: [:new, :create, :edit, :update]

  get '/search' => "search#index"

  resources :products do
    get '/show_image_details' => 'products#show_image_details'
    resources :flavours, only: [:create, :destroy]
    end

  resources :orders do
    get '/submit' => 'orders#submit'
    resources :events
    resources :productions
  end

  resources :productions do
    resources :products
  end

  resources :customers
  resources :sessions, only: [:new, :create, :edit] do
    delete :destroy, on: :collection
    end

end
