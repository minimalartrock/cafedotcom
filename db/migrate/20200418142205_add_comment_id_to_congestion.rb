class AddCommentIdToCongestion < ActiveRecord::Migration[5.2]
	def change
		add_reference :congestions, :comment, foreign_key: true
  end
end
