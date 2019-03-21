class AddNameIndexToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_index :user_profiles, :nickname, unique: true
  end
end
