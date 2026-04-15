class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @q = current_user.items.ransack(params[:q])
    @items = @q.result(distinct: true)
                .includes(:category, images_attachments: :blob)
                .order(updated_at: :desc)

    # ビューで使用するカテゴリ一覧を、ログインユーザーのものに限定して取得
    @categories = current_user.categories.rank(:row_order)
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
    # 🌟 1. 事前チェック：最終的な画像枚数が0枚にならないか確認
    delete_ids = params[:item][:delete_image_ids] || []
    new_images = params[:item][:images]&.reject(&:blank?) || []

    # 計算：現在の枚数 - 削除予定枚数 + 追加予定枚数
    final_count = @item.images.count - delete_ids.count + new_images.count

    if final_count < 1
      @item.errors.add(:images, "を1枚以上選択してください")
      render :edit, status: :unprocessable_entity
      return # 処理を中断してここで編集画面に戻す
    end

    # 🌟 2. チェックを通過した場合のみ、一連の更新処理を実行
    ActiveRecord::Base.transaction do
      # 既存画像の物理削除
      if delete_ids.present?
        delete_ids.each do |image_id|
          image = @item.images.find_by(id: image_id)
          image.purge if image
        end
      end

      # 新規画像の追加
      if new_images.present?
        # 削除後の最新の枚数を再計算
        available_slots = 3 - @item.images.count
        if available_slots > 0
          @item.images.attach(new_images.first(available_slots))
        end
      end

      # 基本情報の更新（images, delete_image_ids は既に処理済みなので除外）
      if @item.update(item_params.except(:images, :delete_image_ids))
        redirect_to item_path(@item), notice: "更新しました"
      else
        # 名前やカテゴリのバリデーションエラー時はトランザクションをロールバック
        raise ActiveRecord::Rollback
      end
    end
  rescue ActiveRecord::Rollback
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
