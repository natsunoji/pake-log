Rails.application.routes.draw do
  # 1. 共通ページ（利用規約など）
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"
  # 🌟 ここに追加！
  get "contact", to: "static_pages#contact"

  # 2. 認証系 (Devise)
  devise_scope :user do
    get "/users", to: "devise/registrations#new"
  end

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # 設定画面
  resource :settings, only: [ :show ], controller: "settings"

  # 3. アイテムに関するルート
  resources :items

  # 4. ログイン状態によるルートの出し分け
  authenticated :user do
    root "items#index", as: :authenticated_root
  end

  root "welcomes#index"

  # --- 以下、システム関連 ---
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
