class CreateOrderStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :order_statuses do |t|
      t.integer :purchaser_id
      t.integer :seller_id
      t.integer :status

      t.timestamps
    end
  end
end
