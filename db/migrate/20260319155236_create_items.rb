class CreateItems < ActiveRecord::Migration[7.2]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false, limit: 40
      t.text :memo, limit: 255

      t.timestamps
    end
    # 同じユーザーが同じ名前の商品を重複登録するのを防ぐ
    add_index :items, [ :user_id, :name ], unique: true
  end
end
