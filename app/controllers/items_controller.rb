class ItemsController < ApplicationController
  # ログインしていないユーザーがアクセスしたらログイン画面に飛ばす
  before_action :authenticate_user!

def index
    # 1. 検索オブジェクト (@q) を作成
    @q = current_user.items.ransack(params[:q])

    # 2. 検索結果 (@items) を取得
    # includes を使ってカテゴリと画像をまとめて読み込む（高速化）
    @items = @q.result(distinct: true)
                .includes(:category, item_images: { image_attachment: :blob })
                .order(created_at: :desc)
  end

  def new
    @item = current_user.items.build
    @item.item_images.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path, notice: "登録が完了しました！"
    else
      flash.now[:alert] = "画像と名前を入力してください。"
      @item.item_images.build if @item.item_images.empty?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    # item_images_attributes: [:image] で、画像ファイルの受け取りを許可
    params.require(:item).permit(:name, :category_id, :memo, item_images_attributes: [ :image ])
  end
end
