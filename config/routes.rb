Rails.application.routes.draw do
  root "homes#top"
  get 'admins/show'
  get "homes/about" => "homes#about"
  get "post_images" => "post_images#index"
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    resources :post_comments
    member do
      get :follows
    end
    resource :relationships, only: [:create, :destroy]

  end

  resources :admins, only: [:show, :edit, :update] do
    member do
      get :followers
    end
  end

  resources :users do
    member do
      get :favorites
    end
  end
end
