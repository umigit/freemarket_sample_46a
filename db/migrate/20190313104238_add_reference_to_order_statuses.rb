class AddReferenceToOrderStatuses < ActiveRecord::Migration[5.2]
  def change
    # add_reference :order_statuses, :item, foreign_key: true

    change_column_null :order_statuses, :item_id, false
  end
end
