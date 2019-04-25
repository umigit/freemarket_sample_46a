class ChangeDatatypeStatusOfOrderStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :order_statuses, :status, :boolean, default: false, null: false
  end
end
