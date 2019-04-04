class AddColumnToUserProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :movile_phone, :string, null: false
    add_column :user_profiles, :card_number, :string, null: true
    add_column :user_profiles, :expiration_month, :string, null: true
    add_column :user_profiles, :expiration_year, :string, null: true
    add_column :user_profiles, :security_code, :string, null: true
  end
end

