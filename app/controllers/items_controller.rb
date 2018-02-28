class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index, :show, :new, :create, :edit, :update, :destroy, :new_review, :create_review]

  def new_review
    @review = Review.new
  end

  def create_review
    @review = Review.new(comment: params[:review][:comment], rating: params[:review][:rating])
    @review.item = Item.find(params[:id])
    @review.buyer = current_user
    @review.seller = @review.item.user

    if @review.save!
      redirect_to item_path(@review.item)
    else
      render :new_review, notice: "Didn't work, please try again"
    end
  end

  def index
    @items = Item.all
  end

  def show
    multiplier = [0, 2, 2, 1.5, 0.8, 0.8, 0.5]

    if Haggle.where(item: @item, user: current_user).empty?
      @price = @item.price
    else
      haggle = Haggle.where(item: @item, user: current_user)[0]
      @price = multiplier[haggle.roll]*@item.price
    end

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save!
      redirect_to user_path(current_user), notice: "Success, item added"
    else
      render :new, notice: "Didn't work, please try again"
    end
  end

  def edit

  end

  def update
    @item.update(item_params)
    redirect_to @item
  end

  def destroy
    @item.destroy
    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :stats, :details, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
