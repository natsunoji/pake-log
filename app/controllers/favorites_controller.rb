class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    current_user.favorites.create!(item: @item)

    respond_to do |format|
      # 🌟 Turbo非対応ブラウザや、JSオフの時のための保険
      format.html { redirect_back fallback_location: items_path }
      # 🌟 これが本命。後で作成する create.turbo_stream.erb を探しに行く
      format.turbo_stream
    end
  end

  def destroy
    favorite = current_user.favorites.find_by!(item: @item)
    favorite.destroy!

    respond_to do |format|
      format.html { redirect_back fallback_location: items_path }
      # 🌟 削除時も Turbo で部分書き換えを行う
      format.turbo_stream
    end
  end

  private

  def set_item
    # ルーティングが resources :items do ... resource :favorite なので :item_id で来る
    @item = Item.find(params[:item_id])
  end
end
