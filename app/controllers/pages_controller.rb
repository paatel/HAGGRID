class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def profile
    @items = Item.where(:user == current_user)
    @reviews = Review.where(:seller == current_user)
    @rating = 0
    @reviews.each do |review|
      @rating += review[:rating]
    end
    @rating = @rating / (@reviews.length)
  end

  def home
    @items = Item.all
  end
end
