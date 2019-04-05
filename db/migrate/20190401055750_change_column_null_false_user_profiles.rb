class ChangeColumnNullFalseUserProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column_null :user_profiles, :user_id, false
  end
end



