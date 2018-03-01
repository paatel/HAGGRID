class RemovePriceColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :haggles, :roll
  end
end
