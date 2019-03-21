class CreateMoneyTransactionRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :money_transaction_records do |t|
      t.integer :point

      t.timestamps
    end
  end
end
