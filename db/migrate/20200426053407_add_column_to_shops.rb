class AddColumnToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :name_kana, :string, after: :name
    add_column :shops, :tel, :string, after: :address
    add_column :shops, :opentime, :string, after: :tel
    add_column :shops, :holiday, :string, after: :opentime
    add_column :shops, :microphone, :boolean, default: false, after: :holiday
    add_column :shops, :wifi, :boolean, default: false, after: :microphone
    add_column :shops, :latitude, :integer, after: :holiday
    add_column :shops, :longitude, :integer, after: :latitude
    add_column :shops, :pr_short, :string, after: :longitude
    add_column :shops, :pref_code, :integer, after: :pr_short
    add_column :shops, :prefname, :string, after: :pref_code
    add_column :shops, :areacode_s, :integer, after: :prefname
    add_column :shops, :areaname_s, :string, after: :areacode_s
    remove_column :shops, :url, :string
  end
end
