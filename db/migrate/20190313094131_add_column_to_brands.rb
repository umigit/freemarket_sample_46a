class AddColumnToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :name, :string
    add_column :brands, :parent_id, :integer

    change_column_null :brands, :name, false
    change_column_null :brands, :parent_id, true
  end
end
