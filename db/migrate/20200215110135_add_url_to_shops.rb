class AddUrlToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :url, :string
  end
end
