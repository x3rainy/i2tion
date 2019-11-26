Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, except: [:new, :create, :index, :delete] do
    resources :bookings, except: [:new, :create]
  end

  resources :tutors do
    resources :bookings
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
