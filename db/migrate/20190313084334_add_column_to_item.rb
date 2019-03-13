class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category, foreign_key: true
    add_reference :items, :region, foreign_key: true
    add_reference :items, :user, foreign_key: true
    add_column :items, :brand_id, :integer
    add_column :items, :shipping_fee, :boolean
    add_column :items, :days_to_ship, :integer
    add_column :items, :price, :integer
    add_column :items, :condition, :integer
    add_column :items, :sales_condition, :boolean

    change_column_null :items, :name, true
    change_column_null :items, :comment, true
    change_column_null :items, :category_id, false
    change_column_null :items, :brand_id, true
    change_column_null :items, :shipping_fee, false
    change_column_null :items, :days_to_ship, false
    change_column_null :items, :price, false
    change_column_null :items, :condition, false
    change_column_null :items, :user_id, false
    change_column_null :items, :sales_condition, false

    change_column_default :items, :sales_condition, false

  end
end
