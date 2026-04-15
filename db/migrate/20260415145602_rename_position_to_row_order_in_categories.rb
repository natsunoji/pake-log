class RenamePositionToRowOrderInCategories < ActiveRecord::Migration[7.2]
  def change
    # 第一引数：テーブル名
    # 第二引数：今のカラム名
    # 第三引数：新しいカラム名
    rename_column :categories, :position, :row_order
  end
end
