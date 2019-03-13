class CreateFavoriteItems < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_items do |t|

      t.timestamps
    end
  end
end
