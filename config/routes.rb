Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  root "products#index"
  get 'products/index_moderator', to: 'products#index_moderator', as: 'index_moderator'

  resources :products
  resources :chats
  resources :orders
  resources :reviews
  resources :messages
  resources :users

end
