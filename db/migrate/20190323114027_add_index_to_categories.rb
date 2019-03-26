class AddIndexToCategories < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :parent_id
  end
end
