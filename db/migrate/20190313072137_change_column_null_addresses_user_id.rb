class ChangeColumnNullAddressesUserId < ActiveRecord::Migration[5.2]
  def change
    change_column_null :addresses, :user_id, false
  end
end
