class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index, :show, :new, :create, :edit, :update, :destroy, :new_review, :create_review, :create_haggle, :create_purchase]

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
    if params[:query].present?
      sql_query = " \
        items.name @@ :query \
        OR items.details @@ :query \
        OR items.stats @@ :query \
      "
      @items = Item.where(sql_query, query: "%#{params[:query]}%")
    else
      @items = Item.all
    end
  end

  def create_haggle
    @item = Item.find(params[:id])
    @haggle = Haggle.create!(item: @item, user: current_user)
    redirect_to item_path(@item)

    # haggle save check
  end

  def create_purchase
    @item = Item.find(params[:id])
    @purchase = Purchase.new(item: @item, buyer: current_user, seller: @item.user)

    haggle = @item.haggles.where(user: current_user).first

    @purchase.amount = haggle.present? ? haggle.price : @item.price

    if @purchase.save
      redirect_to item_path(@item), notice: "Congratulations, purchase successful"
    else
      redirect_to item_path(@item), notice: "Purchase unsuccessful, please try again"
    end
  end

  def show
    @haggles = @item.haggles
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
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
