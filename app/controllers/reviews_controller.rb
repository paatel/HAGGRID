class ReviewsController < ApplicationController
  before_action :set_review, only:[:destroy]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.item = @item
  end

  def destroy
    @review.destroy
    redirect_to item_path(@item)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
