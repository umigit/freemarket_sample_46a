class ChangeDatatypeAvatarOfUserProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :user_profiles, :avatar, :string
  end
end
