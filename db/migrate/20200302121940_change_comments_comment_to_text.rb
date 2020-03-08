# frozen_string_literal: true

class ChangeCommentsCommentToText < ActiveRecord::Migration[5.2]
  def up
    change_column :comments, :comment, :text, limit: 300
  end

  def down
    change_column :comments, :comment, :string
  end
end
