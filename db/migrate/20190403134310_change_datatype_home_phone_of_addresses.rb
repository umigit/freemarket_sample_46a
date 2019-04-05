class ChangeDatatypeHomePhoneOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :home_phone, :string, null: true
  end
end
