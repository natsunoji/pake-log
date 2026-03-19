class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, limit: 20

      t.timestamps
    end
    # 同じユーザーが同じ名前のカテゴリを作れないようにする
    add_index :categories, [ :user_id, :name ], unique: true
  end
end
