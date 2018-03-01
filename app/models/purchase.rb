class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :buyer,
             :class_name => "User",
             :foreign_key => "buyer_id"

  belongs_to :seller,
             :class_name => "User",
             :foreign_key => "seller_id"

  validates :amount, numericality: { greater_than: 0}
end
