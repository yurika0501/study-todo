Rails.application.routes.draw do
  namespace :user do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  # 顧客用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root to: 'homes#top'
    resources :posts, only: [:index,:show,:new,:edit,:create,:destroy,:update] do
      resources :comments, only: [:create,:destroy]
      resource :favorites, only: [:create, :destroy]
    end
      # 会員退会機能のURL
      get 'unsubscribe/' => 'users#unsubscribe', as: 'confirm_unsubscribe'
      patch 'withdraw/' => 'users#withdraw', as: 'withdraw_user'
      # 検索用
      get "search" => "searches#search"
      
    resources :users, only: [:show,:edit,:update] do
      # フォロー、フォロワー機能
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  
  
  # ゲスト用
  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
      root to: "homes#top"
      resources :users, only: [:index, :show,:destroy]
      resources :posts, only: [:destroy]
  end
end