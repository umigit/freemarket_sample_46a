class AddNameIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :mail, unique: true
    add_index :users, :password, unique: true
  end
end
