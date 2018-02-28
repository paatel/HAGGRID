class AddRolltoHaggle < ActiveRecord::Migration[5.1]
  def change
    add_column :haggles, :roll, :integer
  end
end
