class AddPriceColumnForHaggles < ActiveRecord::Migration[5.1]
  def change
    add_column :haggles, :price, :integer
  end
end
