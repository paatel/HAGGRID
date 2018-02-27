class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    @items = Item.all
  end

  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: "Success, item added"
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
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :stats, :details, :user_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
