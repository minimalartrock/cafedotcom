class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :map, null: false
      t.string :image_1
      t.string :image_2
      t.string :image_3

			t.timestamps
    end
  end
end
