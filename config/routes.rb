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
    get 'customers/show'
    get '/admins/customers/:id/list_of_posts', to: 'customers#list'
    get '/admin/customers/:id/edit', to: 'customers#edit'
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
    get 'members/profile/:id', to: 'members#show'
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
    get 'customers/posts/new', to: 'posts#new', as: 'posts_new'
    post 'customers/posts/create', to: 'posts#create', as: 'posts_create'
    get 'customers/posts', to: 'posts#index', as: 'posts'
    get 'customers/posts/:id', to: 'posts#show', as: 'posts_show'
    resources :tags, only: [:index]
  end

end




# get 'customers/posts/new', to: 'posts#new'
#     post 'customers/posts/:id', to: 'posts#create'
#     get 'customers/posts', to: 'posts#index'
#     get 'customers/posts/:id', to: 'posts#show'