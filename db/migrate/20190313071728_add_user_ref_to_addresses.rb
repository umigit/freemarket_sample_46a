class AddUserRefToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user, foreign_key: true
    change_column_null :addresses, :user_id, false
  end
end
