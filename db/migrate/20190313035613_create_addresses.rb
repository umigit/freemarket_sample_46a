class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code
      t.string :city
      t.string :block
      t.string :building
      t.reference :region

      t.timestamps
    end
  end
end
