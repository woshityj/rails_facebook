Rails.application.routes.draw do

  get 'users/index'

  devise_for :users, controllers: { sessions: "users/sessions"}

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
