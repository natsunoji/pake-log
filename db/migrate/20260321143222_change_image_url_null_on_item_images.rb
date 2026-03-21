class ChangeImageUrlNullOnItemImages < ActiveRecord::Migration[7.2]
  def change
    # image_url カラムの null: false を null: true (空を許可) に変更するにゃ
    change_column_null :item_images, :image_url, true
  end
end
