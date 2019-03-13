class ChangeColumnNullPointTransactionRecords < ActiveRecord::Migration[5.2]
  def change
    change_column_null :point_transaction_records, :point, false
  end
end
