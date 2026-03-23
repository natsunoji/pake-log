Rails.application.routes.draw do
  # 1. アイテムに関する全ルートを開放 (index, show, new, create, edit, update, destroy)
  resources :items

  # 2. 認証系 (Devise)
  devise_for :users

  # 3. ログイン状態によるルートの出し分け
  # ログインしている場合は「ライブラリ（一覧）」をトップにする
  authenticated :user do
    root "items#index", as: :authenticated_root
  end

  # ログインしていない場合は「使い方（Welcome）」をトップにする
  root "welcomes#index"

  # --- 以下、システム・PWA関連（変更なし） ---

  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA関連
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
