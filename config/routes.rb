Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'pages#profile', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resources :haggles, only: :create
    member do
      get 'review', to: 'items#new_review'
      post 'review', to: 'items#create_review', as: 'reviews'
    end
  end
  # get /items/1/review form
  # post /items/1/review creates
end
