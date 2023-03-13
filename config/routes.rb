Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  scope module: :user do
    root to: 'homes#top'
    resources :posts, only: [:index,:show,:new,:edit,:create,:destroy,:update] do
      resources :comments, only: [:create,:destroy]
    end
      get 'unsubscribe/' => 'users#unsubscribe', as: 'confirm_unsubscribe'
      patch 'withdraw/' => 'users#withdraw', as: 'withdraw_user'
    resources :users, only: [:show,:edit,:update] 
  end
  
  
  # ゲスト用
  devise_scope :user do
    post 'user/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
      root to: "homes#top"
      resources :users, only: [:index, :show,:destroy]
      resources :posts, only: [:destroy]
  end
end
