class RemoveColumnFromCongestion < ActiveRecord::Migration[5.2]
	def change
		remove_column :congestions, :user_id, :integer
		remove_column :congestions, :shop_id, :integer
  end
end
