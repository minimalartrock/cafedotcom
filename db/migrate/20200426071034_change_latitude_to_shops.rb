# frozen_string_literal: true

class ChangeLatitudeToShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :latitude, :float
    change_column :shops, :longitude, :float
  end
end
