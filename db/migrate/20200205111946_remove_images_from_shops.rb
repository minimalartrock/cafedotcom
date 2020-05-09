# frozen_string_literal: true

class RemoveImagesFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :image_1, :string
    remove_column :shops, :image_2, :string
    remove_column :shops, :image_3, :string
  end
end
