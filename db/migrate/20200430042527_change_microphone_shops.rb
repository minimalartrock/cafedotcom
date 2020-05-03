# frozen_string_literal: true

class ChangeMicrophoneShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :microphone, :outret
  end
end
