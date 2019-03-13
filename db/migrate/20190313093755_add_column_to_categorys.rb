class AddColumnToCategorys < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name, :string
    add_column :categories, :parent_id, :integer

    change_column_null :categories, :name, false
    change_column_null :categories, :parent_id, true
  end
end
