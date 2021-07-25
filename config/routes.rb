Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
