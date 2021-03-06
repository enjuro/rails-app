Rails.application.routes.draw do
  root "homes#top"
  get 'admins/show'
  get "about" => "homes#about"
  get "links" => "homes#links"
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
  resources :post_images, only: [:new, :create, :index,:edit, :update, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    resources :post_comments
    member do
      get :favorites
      get :relationships
    end
  end

  resources :admins, only: [:show, :edit, :update] do
    collection do
      get 'search'
    end
    resource :relationships, only: [:create, :destroy]
  end
end
