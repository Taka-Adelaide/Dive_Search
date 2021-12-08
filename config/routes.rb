Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => "homes#about"

  devise_for :users

  resources :spots, only: [:show] do
    resource :spot_favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
    collection do
      get "unsubscribe"
      patch "withdraw"
    end

    resources :comments, except: [:new]
      resource :comment_favorites, only: [:create, :destroy]

  end

  get "/search" => "searches#search"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
