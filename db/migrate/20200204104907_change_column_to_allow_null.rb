# frozen_string_literal: true

class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :shops, :map, :string, null: true
  end

  def down
    change_column :shops, :map, :string, null: false
  end
end
