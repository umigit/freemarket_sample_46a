class DeleteUniqFromNickname < ActiveRecord::Migration[5.2]
  def change
    remove_index :user_profiles, :nickname
    add_index :user_profiles, :nickname
  end
end


