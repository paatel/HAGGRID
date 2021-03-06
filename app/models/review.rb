class Review < ApplicationRecord
  belongs_to :item
  belongs_to :buyer,
             :class_name => "User",
             :foreign_key => "buyer_id"

  belongs_to :seller,
             :class_name => "User",
             :foreign_key => "seller_id"

  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6}
end
