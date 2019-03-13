class AddUserRefToFavoriteItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorite_items, :user, foreign_key: true
    add_reference :favorite_items, :item, foreign_key: true

    change_column_null :favorite_items, :user_id, false
    change_column_null :favorite_items, :item_id, false
  end
end
