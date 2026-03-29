class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @q = current_user.items.ransack(params[:q])
    @items = @q.result(distinct: true)
                .includes(:category, images_attachments: :blob)
                .order(updated_at: :desc)
  end

  def show
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to item_path(@item), notice: "登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # 🌟 トランザクション処理で、画像削除・追加・基本情報の更新をセットで行う
    ActiveRecord::Base.transaction do
      # 1. 既存画像の削除処理
      if params[:item][:delete_image_ids].present?
        params[:item][:delete_image_ids].each do |image_id|
          image = @item.images.find_by(id: image_id)
          image.purge if image
        end
      end

      # 2. 新規画像の追加処理（JS側で3枚制限されているが、念のためサーバー側でもガード）
      if params[:item][:images].present?
        new_images = params[:item][:images].reject(&:blank?)
        available_slots = 3 - @item.images.count

        if available_slots > 0
          images_to_attach = new_images.first(available_slots)
          @item.images.attach(images_to_attach)
        end
      end

      # 3. 基本情報の更新（images, delete_image_ids は既に処理済みなので除外）
      if @item.update(item_params.except(:images, :delete_image_ids))
        redirect_to item_path(@item), notice: "更新しました"
      else
        # バリデーションエラー時はトランザクションをロールバックさせる
        raise ActiveRecord::Rollback
      end
    end
  rescue ActiveRecord::Rollback
    # ロールバック後に編集画面を再表示
    render :edit, status: :unprocessable_entity
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
    redirect_to items_path, alert: "指定されたアイテムが見つかりません、または権限がありません。"
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :memo, images: [], delete_image_ids: [])
  end
end
