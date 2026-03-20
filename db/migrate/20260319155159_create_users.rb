class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 20
      t.string :email, null: false
      t.string :avatar_url
      t.string :provider
      t.string :uid

      t.timestamps
    end
    # メールアドレスでの重複登録防止
    add_index :users, :email, unique: true
  end
end
