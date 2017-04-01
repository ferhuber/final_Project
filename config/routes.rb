Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'
  delete     '/logout'        =>  'sessions#destroy'
  get 'customers/profile'   => 'customers#show'

  resources :customers, only: [:new, :index, :create, :edit, :update, :show] do
  get '/password_change' => 'customers#update_password'
  put :password
 end
  resources :passwords_resets, only: [:new, :create, :edit, :update]

  get '/search' => "search#index"
  resources :products do
    resources :flavours, only: [:create, :destroy]
    end


  resources :customers
  resources :sessions, only: [:new, :create, :edit] do
    delete :destroy, on: :collection
    end

end
