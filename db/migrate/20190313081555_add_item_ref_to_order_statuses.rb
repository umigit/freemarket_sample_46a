class AddItemRefToOrderStatuses < ActiveRecord::Migration[5.2]
  def change

    change_column_null :order_statuses, :purchaser_id, false
    change_column_null :order_statuses, :seller_id, false
    change_column_null :order_statuses, :status, false
    # change_column_null :order_statuses, :item_id, false
  end
end
