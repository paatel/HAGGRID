class AddReferencesToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :amount, :integer
    add_reference :purchases, :item, foreign_key: true
    add_reference :purchases, :buyer, index: true
    add_reference :purchases, :seller, index: true
    add_foreign_key :purchases, :users, column: :buyer_id, primary_key: :id
    add_foreign_key :purchases, :users, column: :seller_id, primary_key: :id
  end
end
