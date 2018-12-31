Rails.application.routes.draw do
    resources :addresses
    resources :classifications
    resources :genres
    resources :books do
      member do
        post 'add_comment'
        delete 'remove_comment/:comment_id',
        to: 'books#remove_comment', :format => false,
        as: 'remove_comment'
      end
    end
    resources :readers
    resources :publishers
    devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
    devise_for :users, skip: :all
    get 'users/profile'
    root "books#index"
    resources :books do
      member do
        post 'add_genre'
        delete 'remove_genre/:genre_id',
        to: 'books#remove_genre', :format => false,
        as: 'remove_genre'
      end
    end
    get 'addresses/:id/default', to: 'addresses#default', as:'addresses_default'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
