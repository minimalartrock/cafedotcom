# frozen_string_literal: true

class RemoveImageFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :image
  end

  def down
    remove_column :users, :image, :string
  end
end
