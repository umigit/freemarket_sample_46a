class AddHomePhoneToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :home_phone, :integer, null: true
  end
end


