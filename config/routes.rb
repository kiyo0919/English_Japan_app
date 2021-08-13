Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
    collection do
      get :search
    end
  end
   resources :relationships, only: [:create, :destroy]
   resources :words, only: [:index, :create, :destroy] do
    collection do
      get :search
    end
   end
   resources :messages, only: [:create]
   resources :rooms, only: [:create, :show]
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
