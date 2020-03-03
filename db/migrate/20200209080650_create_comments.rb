# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment, limit: 300, null: false
      t.references :shop, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
