class RemoveStatusFromComments < ActiveRecord::Migration[5.2]
	def change
		remove_column :comments, :status, :integer
  end
end
