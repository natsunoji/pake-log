class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [ :edit, :update, :destroy ]

  def index
    # ユーザー自身のカテゴリを並び順通りに取得
    @categories = current_user.categories.rank(:row_order)
    # 新規作成用の空オブジェクト
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: "カテゴリを追加しました"
    else
      @categories = current_user.categories
      render :index, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @category = current_user.categories.find(params[:id])
    # row_order_position という仮想カラムを通じて保存する
    if @category.update(category_params)
      respond_to do |format|
        format.html { redirect_to categories_path, notice: "カテゴリを更新しました", status: :see_other }
        format.json { render json: @category } # 🌟 JS（patch）にはJSONで返す
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, notice: "カテゴリを削除しました"
    else
      # アイテムが紐付いている場合などは削除失敗メッセージを表示
      redirect_to categories_path, alert: "このカテゴリは使用中のため削除できません"
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :row_order_position)
  end
end
