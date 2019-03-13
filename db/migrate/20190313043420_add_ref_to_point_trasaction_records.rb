class AddRefToPointTrasactionRecords < ActiveRecord::Migration[5.2]
  def change
    add_reference :point_transaction_records, :user, null: false, foregin_key: true
    add_reference :point_transaction_records, :order_status, null: false, foregin_key: true
  end
end
