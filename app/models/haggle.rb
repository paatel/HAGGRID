class Haggle < ApplicationRecord
  belongs_to :user
  belongs_to :item
  # validates :price, numericality: { greater_than: 0 }
  validates :user, uniqueness: { scope: :item, message: "Can only haggle once" }
  before_create :set_price

  private

  def get_random_multiplier
    [2, 1.3, 1.3, 0.8, 0.8, 0.5].sample
  end

  def set_price
    self.price = item.price * get_random_multiplier
  end
end
