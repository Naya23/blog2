Rails.application.routes.draw do
  resources :articles
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  resources :posts
    devise_for :users, controllers: { sessions: 'users/sessions' }   
	devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :homes
  root to: 'homes#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)
end
