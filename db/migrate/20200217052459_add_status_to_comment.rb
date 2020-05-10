# frozen_string_literal: true

class AddStatusToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :status, :integer, default: 1
  end
end
