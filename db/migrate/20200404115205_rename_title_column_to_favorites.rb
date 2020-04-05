class RenameTitleColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :shops_id, :shop_id
  end
end
