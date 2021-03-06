Rails.application.routes.draw do
  resources :bankaccounts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    resources :memberships do
      resources :membership_orders, only: :create
      resources :membership_orders, only: :index
    end
    resources :addresses
      get 'addresses/:id/default', to: 'addresses#default', as:'addresses_default'
    resources :classifications
    resources :genres
    resources :publishers do
      member do
        post 'add_publisher_comment'
        delete 'remove_publisher_comment/:publisher_comment_id',
        to: 'publishers#remove_publisher_comment', :format => false,
        as: 'remove_publisher_comment'
      end
    end
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
    get 'orders/:id/delivery', to: 'orders#delivery', as:'orders_delivery'
    get 'orders/:id/pickup', to: 'orders#pickup', as:'orders_pickup'
    resources :membership_orders
    resources :readers
    devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
    devise_for :users, skip: :all
    get 'users/my_books'
    get 'users/profile'
    get 'users/about'
    get 'users/faq'
    get 'users/publishers'
    get 'users/memberships'
    get 'users/my_sales'
    resources :billings, only: [] do
        collection do
            get 'index'
            get 'prepay'
            get 'execute'
        end
    end
    resources :millings, only: [] do
        collection do
            get 'alternative'
            get 'pre_pay'
            get 'execute'
            get 'index'
        end
    end

    get 'flows/create', to: 'flows#create'
    root "books#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
