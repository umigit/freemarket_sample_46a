class AddNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :relative_last_name, :string, null: false
    add_column :addresses, :relative_first_name, :string, null: false
    add_column :addresses, :relative_last_name_kana, :string, null: false
    add_column :addresses, :relative_first_name_kana, :string, null: false
  end
end

