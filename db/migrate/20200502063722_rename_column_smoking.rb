# frozen_string_literal: true

class RenameColumnSmoking < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :smokin, :smoking
  end
end
