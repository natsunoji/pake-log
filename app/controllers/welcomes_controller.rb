class WelcomesController < ApplicationController
  def index
    # テスト用のフラッシュメッセージ
    flash.now[:notice] = "テストメッセージ"
  end
end
