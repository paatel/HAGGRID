class AddSellerColumnToReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :user_id
    add_reference :reviews, :buyer, index: true
    add_reference :reviews, :seller, index: true
    add_foreign_key :reviews, :users, column: :buyer_id, primary_key: :id
    add_foreign_key :reviews, :users, column: :seller_id, primary_key: :id
  end
end
