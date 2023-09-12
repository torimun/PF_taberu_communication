Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
  devise_for :customers, controllers: {
    registrations: "customers/registrations",
    sessions: 'customers/sessions'
}

#ゲスト用ログイン
# URL /customers/guest_sign_in
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

# 管理者用
# URL /admin/sign_in ...
  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #以下管理者用
  namespace :admins do
    get 'homes/top', to: "homes#top"
    resources :posts, only: [:index, :new, :create]
    resources :seasonings_spices, only: [:new, :create, :show, :edit, :update]
  end

  namespace :admins do
    get 'customers/index'
    get '/admin/customers/:id', to: 'customers#show', as: 'customers_show'
    get '/admins/customers/list_of_posts/:id', to: 'customers#list', as: 'customers_posts_list'
    get '/admin/customers/edit/:id', to: 'customers#edit', as: 'customers_edit'
    patch '/admin/customers/:id', to: 'customers#update'
  end

  #以下顧客用
  #homesコントローラー関連
  namespace :customers do
    get 'homes/top'
    get 'homes/welcome', to: 'homes#welcome'
    get 'homes/new'
    post 'homes/create', to: 'homes#create'
    get 'homes/id', to: 'homes#show'
  end

  #membersコントローラー関連
  namespace :customers do
    get 'members/profile', to: 'members#show'
    get 'members/information/edit', to: 'members#edit'
    patch 'members/information', to: 'members#update'

    #退会確認画面
    get 'members/confirm_withdraw', to: 'members#confirm'
    #会員の退会処理
    patch 'members/withdraw', to: 'members#withdraw'
  end

  #いいね一覧、キーワード検索、タグ検索のコントローラー
  namespace :customers do
    get 'goods/index'
    get 'keyword/index'
    get 'tag/index'
  end

  #postsコントローラー関連
  namespace :customers do
    get 'posts/new', to: 'posts#new', as: 'posts_new'
    post 'posts/create', to: 'posts#create', as: 'posts_create'
    get 'posts', to: 'posts#index', as: 'posts'
    get 'posts/:id', to: 'posts#show', as: 'posts_show'
    resources :tags, only: [:index]
  end

end