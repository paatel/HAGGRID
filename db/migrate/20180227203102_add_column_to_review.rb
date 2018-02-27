class AddColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :user, index: true
    add_reference :reviews, :item, index: true
  end
end
