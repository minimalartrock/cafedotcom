# frozen_string_literal: true

class RemoveMapFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :map, :string
  end
end
