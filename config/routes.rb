Rails.application.routes.draw do
  resources :classifications
  resources :genres
  resources :books
  resources :readers
  resources :publishers
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_for :users, skip: :all
  root "publishers#index"
  resources :books do
    member do
      post 'add_genre'
      delete 'remove_genre/genre_id',
      #delete ':id/remove_genre/:genre_id',
      to: 'books#remove_genre', :format => false,
      as: 'remove_genre'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
