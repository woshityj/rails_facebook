Rails.application.routes.draw do

  get 'users/index'

  match '/users/:id', to: 'users#show', via: 'get'

  resources :users, :only =>[:show]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    authenticated :user do
      root "posts#index", as: :authenticated_root
    end
    
    unauthenticated do
      root 'users/sessions#new'
    end
  end

  resources :friends
  resources :posts
  resources :likes
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
