Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #以下管理者用
  namespace :admin do
    get 'homes/top'
    resources :posts, only: [:index, :new, :create]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :seasonings_spices, only: [:new, :create, :show, :edit, :update]
  end

  #以下顧客用
  #homesコントローラー関連
  namespace :customer do
    get 'homes/top'
    get 'homes/welcome', to: 'homes#welcome'
    get 'homes/new'
    post 'homes/:id', to: 'homes#create'
    get 'homes/id', to: 'homes#show'
  end

  #membersコントローラー関連
  namespace :customer do
    get 'members/show'
    get 'members/edit'
    patch 'members/information', to: 'members#update'

    #退会確認画面
    get 'members/confirm_withdraw', to: 'members#confirm'
    #会員の退会処理
    patch 'members/withdraw', to: 'members#withdraw'
  end

  #いいね一覧、キーワード検索、タグ検索のコントローラー
  namespace :customer do
    get 'goods/index'
    get 'keyword/index'
    get 'tag/index'
  end

  #postsコントローラー関連
  namespace :customer do
    resources :posts, only: [:new, :create, :index, :show]
  end
end
