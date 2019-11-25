Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  devise_for :users
  root to: 'pages#home'

  resources :users, except: [:index, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
