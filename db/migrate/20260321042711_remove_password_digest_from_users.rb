class RemovePasswordDigestFromUsers < ActiveRecord::Migration[7.2]
  def change
    if column_exists?(:users, :password_digest)
      remove_column :users, :password_digest, :string
    end
  end
end
