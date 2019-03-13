class ChangeColumnNullUserProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column_null :user_profiles, :last_name, false
    change_column_null :user_profiles, :first_name, false
    change_column_null :user_profiles, :last_name_kana, false
    change_column_null :user_profiles, :first_name_kana, false
    change_column_null :user_profiles, :birth_y, false
    change_column_null :user_profiles, :birth_m, false
    change_column_null :user_profiles, :birth_d, false
    change_column_null :user_profiles, :nickname, false
    change_column_null :user_profiles, :avatar, true
    change_column_null :user_profiles, :comment, true
  end
end
