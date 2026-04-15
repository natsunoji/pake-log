class AddPositionToCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :categories, :position, :integer
  end
end
