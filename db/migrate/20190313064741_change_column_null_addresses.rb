class ChangeColumnNullAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column_null :addresses, :postal_code, false
    change_column_null :addresses, :region_id, false
    change_column_null :addresses, :city, false
    change_column_null :addresses, :block, false
    change_column_null :addresses, :building, true
    change_column_null :addresses, :user_id, false
  end
end
