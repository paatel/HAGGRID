class Review < ApplicationRecord
  belongs_to :item
  validates :rating, presence: true
end
