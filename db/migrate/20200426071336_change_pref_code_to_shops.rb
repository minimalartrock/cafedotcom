class ChangePrefCodeToShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :pref_code, :string
    change_column :shops, :areacode_s, :string
  end
end
