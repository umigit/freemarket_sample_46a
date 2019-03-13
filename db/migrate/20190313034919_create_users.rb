class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :phone
      t.integer :paying_way
      t.string :mail
      t.string :password

      t.timestamps
    end
  end
end
