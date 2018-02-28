class AddItemsAndUsersToHaggle < ActiveRecord::Migration[5.1]
  def change
    add_reference :haggles, :user, foreign_key: true
    add_reference :haggles, :item, foreign_key: true
  end
end
