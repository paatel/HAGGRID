class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :price, presence: true
  validates :details, presence: true
  validates :stats, presence: true
end
