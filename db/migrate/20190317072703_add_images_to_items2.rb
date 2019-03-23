class AddImagesToItems2 < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :images, :string
  end
end
