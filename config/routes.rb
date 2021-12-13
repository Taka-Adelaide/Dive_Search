Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root to: "homes#top"
  get "/about" => "homes#about"
  post "/comments/:id/comment_favorites" => "comment_favorites#create", as: "comment_favorites"
  delete "/comments/:id/comment_favorites" => "comment_favorites#destroy", as: "comment_favorite"

  resources :spots, only: [:index, :show] do
    resource :spot_favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    collection do
      get "unsubscribe"
      patch "withdraw"
    end

    resources :comments
      # resource :comment_favorites, only: [:create, :destroy]

  end

  get "/search" => "searches#search"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
