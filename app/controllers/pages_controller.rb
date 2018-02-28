class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def profile
    @items = Item.where(:user == current_user)
  end

  def home
    @items = Item.all
  end
end
