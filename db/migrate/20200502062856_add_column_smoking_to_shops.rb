# frozen_string_literal: true

class AddColumnSmokingToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :smokin, :boolean, default: false, after: :wifi
  end
end
