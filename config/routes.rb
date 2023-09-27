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
    resources :posts, only: [:index, :show, :create]
    resources :seasonings_spices, only: [:new, :create, :show, :edit, :update]
  end

  namespace :admins do
    get 'customers/index'
    get 'customers/:id', to: 'customers#show', as: 'customers_show'
    get 'customers/post_show/:id', to: 'customers#post_show', as: 'customers_post_show'
    get 'customers/edit/:id', to: 'customers#edit', as: 'customers_edit'
    patch 'customers/:id', to: 'customers#update', as: 'customers_update'
  end

  #以下顧客用
  #homesコントローラー関連
  namespace :customers do
    get 'homes/top'
    get 'homes/welcome', to: 'homes#welcome'
    get 'homes/new'
    post 'homes/create', to: 'homes#create'
    get 'homes/post_index'
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
    #検索時のコントローラーのアクションが行われるよう定義
    get "search" => "searches#search"
    #検索一覧画面のurl
    get 'searches/search'
    get 'likes/like'
    get 'tag/index'
    get 'tag/show/:id', to: 'tag#show', as: 'tag_show'
  end

  #postsコントローラー関連
  namespace :customers do
    resources :posts, only: [:new, :create, :index, :show] do
      #以下タグ機能関連
      resources :tags, only: [:index]
      #以下いいね機能関連
      resource :favorites, only: [:create, :destroy]
      #以下コメント機能
      # resources :comments, only: [:create]
    end
  end

end