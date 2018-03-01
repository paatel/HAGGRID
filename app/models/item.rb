class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :haggles
  validates :name, presence: true
  validates :price, presence: true
  validates :details, presence: true
  validates :stats, presence: true
  mount_uploader :photo, PhotoUploader

  # def price_for_user(user)
  # end
end
