# frozen_string_literal: true

class AddColumnShops < ActiveRecord::Migration[5.2]
  def change
    add_column :congestions, :user_id, :integer
    add_column :congestions, :shop_id, :integer
  end
end
