class ChangeColumnNullUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :paying_way, false
    change_column_null :users, :mail, false
    change_column_null :users, :password, false
  end
end
