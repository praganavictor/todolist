class AddStatusToList < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :status, :integer, default: 0
  end
end
