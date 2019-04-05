class RenameRegionIdColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :region_id, :prefecture_id
  end
end
