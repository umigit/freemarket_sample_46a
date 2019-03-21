class AddItemRefToItemImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :item_images, :item, foreign_key: true
    add_column :item_images, :image, :string

    change_column_null :item_images, :image, false
    change_column_null :item_images, :item_id, false
  end
end
