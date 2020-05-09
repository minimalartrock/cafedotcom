# frozen_string_literal: true

class ChangeColumnShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :created_at, :datetime, null: false, after: :areaname_s
    change_column :shops, :updated_at, :datetime, null: false, after: :created_at
  end
end
