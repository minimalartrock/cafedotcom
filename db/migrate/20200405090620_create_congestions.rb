class CreateCongestions < ActiveRecord::Migration[5.2]
  def change
    create_table :congestions do |t|
      t.integer :status, default: 0, null: false
      t.references :shop, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
