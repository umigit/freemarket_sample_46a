class RemovePrefectureIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :prefecture_id
  end
end

