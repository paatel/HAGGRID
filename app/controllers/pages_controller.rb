class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def profile
    @purchases = Purchase.where(buyer: current_user)
    @items = Item.where(user: current_user)
    @reviews = Review.where(seller: current_user)
    @rating = 0

    if @reviews.length > 0

      @reviews.each do |review|
        @rating += review[:rating]
      end
      @rating = @rating / (@reviews.length)
    end
  end

  def home
    @items = Item.all.limit(3)
  end
end
