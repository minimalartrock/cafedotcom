class ChangeStatusDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :congestions, :status, from: 0, to: 1
  end
end
