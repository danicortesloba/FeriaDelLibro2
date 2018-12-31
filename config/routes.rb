Rails.application.routes.draw do
    resources :addresses
    get 'addresses/:id/default', to: 'addresses#default', as:'addresses_default'
    resources :classifications
    resources :genres
    resources :books do
      resources :orders, only: :create
      resources :orders, only: :index
      member do
        post 'add_comment'
        delete 'remove_comment/:comment_id',
        to: 'books#remove_comment', :format => false,
        as: 'remove_comment'
      end
      member do
        post 'add_genre'
        delete 'remove_genre/:genre_id',
        to: 'books#remove_genre', :format => false,
        as: 'remove_genre'
      end
    end
    resources :orders
    resources :readers
    resources :publishers
    devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
    devise_for :users, skip: :all
    get 'users/profile'
    root "books#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
