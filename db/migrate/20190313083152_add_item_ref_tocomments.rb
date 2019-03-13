class AddItemRefTocomments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :item, foreign_key: true

    change_column_null :comments, :content, false
    change_column_null :comments, :user_id, false
    change_column_null :comments, :item_id, false

  end
end
