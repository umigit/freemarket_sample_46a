class RemoveRegionFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :region_id
  end
end
