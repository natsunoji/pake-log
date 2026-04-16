Rails.application.routes.draw do
  # 1. 共通ページ（利用規約など）
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"
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
  resources :items do
    # 🌟 アイテムに紐付く「お気に入り」ルートを追加
    # 単数形 resource にすることで、ID不要の /items/:item_id/favorite が生成される
    resource :favorite, only: [ :create, :destroy ]
  end

  # 4. カテゴリに関するルートを追加
  resources :categories, only: [ :index, :create, :edit, :update, :destroy ]

  # 5. ログイン状態によるルートの出し分け
  authenticated :user do
    root "items#index", as: :authenticated_root
  end

  root "welcomes#index"

  # --- システム関連 ---
  # ヘルスチェック用（Railsの標準機能を使用）
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
