# frozen_string_literal: true

class RemoveNicknameFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :nickname
  end

  def down
    remove_column :users, :nickname, :string
  end
end
