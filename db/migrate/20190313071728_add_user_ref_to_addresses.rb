class AddUserRefToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user, foreign_key: true
  end
end
