class ChangeColumnNullRegions < ActiveRecord::Migration[5.2]
  def change
    change_column_null :regions, :parent_id, true
    change_column_null :regions, :name, false

    add_index :regions, :name, unique: true
  end
end
