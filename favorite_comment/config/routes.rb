Rails.application.routes.draw do
  get 'searches/search'
  get 'searchs/search'
  # get 'relationships/create'
  # get 'relationships/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get "home/about" => "homes#about"
  
  
  # 検索機能の実装
  get 'search' => "searches#search"


  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  
  # フォロー機能の実装
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    
  end

end
