# frozen_string_literal: true

Rails.application.routes.draw do
  get 'deliveries/top'
  namespace :customer do
    get 'customers/confirm_withdraw'
    get 'orders/index'
    get 'orders/show'
    get 'orders/success'
    get 'cart_items/index'
    get 'products/index'
    get 'products/show'
  end
  get 'pages/home'
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, controllers: {
    sessions: 'customer/sessions',
    registrations: 'customer/registrations'
  }

  namespace :admin do
    get 'deliveries/top'
    resources :fragrances, only: %i[index show new create edit update]
    resources :deliveries, only: %i[index show new create edit update]
    resources :products, only: %i[index show new create edit update]
    resources :orders, only: %i[show update]
    resources :customers, only: %i[index show update]
    root to: 'pages#home'
  end
  scope module: :customer do
    resources :products, only: %i[index show]
    resources :cart_items, only: %i[index create destroy] do
      member do
        patch 'increase'
        patch 'decrease'
      end
    end
    resources :checkouts, only: [:create]
    resources :webhooks, only: [:create]
    resources :orders, only: %i[index show] do
      collection do
        get 'success'
      end
    end
    resources :customers do
      collection do
        get 'confirm_withdraw'
        patch 'withdraw'
      end
    end
  end

  get 'customer/fragrances/:id', to: 'customer/products#fragrance', as: 'fragrance'

  get 'shopping' => 'shopping#top'

  get 'navigate' => 'navigate#top'

  get 'items' => 'items#top'
  get 'items/01' => 'items#number'
  get 'items/fravor01' => 'items#fravor'

  get 'about' => 'about#top'
  get 'about/beatiful' => 'about#beatiful'
  get 'about/fravor' => 'about#fravor'
  get 'about/life' => 'about#life'
  get 'about/RaMN' => 'about#RaMN'

  get 'delivery' => 'pages#home'
  post 'delivery' => 'pages#delivery'

  root to: 'home#top'
  post 'create' => 'home#create'
  post 'pay' => 'customer/cart_items#pay'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
