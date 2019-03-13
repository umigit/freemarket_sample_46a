class AddRefToMoneyTransactionRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :money_transaction_records, :user, foreign_key: true
    add_reference :money_transaction_records, :order_status, foreign_key: true

    change_column_null :money_transaction_records, :user_id, false
    change_column_null :money_transaction_records, :point, false
    change_column_null :money_transaction_records, :order_status_id, false
  end
end
