class ItemsController < ApplicationController
  before_action :authenticate_user!
  # index と new 以外（つまり特定の1件を扱うアクション）で set_item を動かす
  before_action :set_item, only: %i[show edit update destroy]

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
      redirect_to item_path(@item), notice: "登録しました"
    else
      # エラー時はnew画面を再表示
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
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
    # 🌟 ログインしている自分の説明書の中から探す
    @item = current_user.items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to items_path, alert: "指定されたアイテムが見つかりません、または権限がありません。"
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :memo, images: [])
  end
end
