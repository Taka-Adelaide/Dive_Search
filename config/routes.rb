Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/show'
  get 'comments/edit'
  get 'users/show'
  get 'users/edit'
  get 'users/unsubscribe'
  get 'spots/show'
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
