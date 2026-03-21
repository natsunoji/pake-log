class ChangeCategoryIdNullOnItems < ActiveRecord::Migration[7.2]
  def change
    # items テーブルの category_id カラムを、空(null)でもOK（true）にする
    change_column_null :items, :category_id, true
  end
end
