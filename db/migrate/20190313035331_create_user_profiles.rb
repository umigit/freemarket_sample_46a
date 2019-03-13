class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.integer :birth_y
      t.integer :birth_m
      t.integer :birth_d
      t.string :nickname
      t.text :avatar
      t.text :comment

      t.timestamps
    end
  end
end
