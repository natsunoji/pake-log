class ItemsController < ApplicationController
  before_action :authenticate_user!
  # 指定したアクションの前に、共通の「アイテム探し」をさせる
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]

  def index
    @q = current_user.items.ransack(params[:q])
    @items = @q.result(distinct: true)
                .includes(:category, images_attachments: :blob)
                .order(updated_at: :desc)
  end

  def show
    # before_action で @item がセットされているので中身は空でOK
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      # 作成成功時は詳細画面(show)へ飛ばすのが一般的です
      redirect_to item_path(@item), notice: "登録しました"
    else
      # エラー時はnew画面を再表示
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # 画像が送られてきていない（空の）場合は、パラメータから images を除外する
    # これにより、Active Storage が勝手に画像を削除するのを防ぎます
    filtered_params = item_params
    if params[:item][:images].blank? || params[:item][:images].all?(&:blank?)
      filtered_params = filtered_params.except(:images)
    end

    if @item.update(filtered_params)
      redirect_to item_path(@item), notice: "更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path, notice: "パケを削除しました", status: :see_other
    else
      redirect_to item_path(@item), alert: "削除に失敗しました"
    end
  end

  private

  def set_item
    @item = current_user.items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to items_path, alert: "指定されたアイテムが見つかりません。"
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :memo, images: [])
  end
end
