class HagglesController < ApplicationController
  def create
    if Haggle.where(item: params[:item_id], user: current_user).empty?
      Haggle.create(user: current_user, item_id: params[:item_id], roll: rand(6)+1)
      redirect_to item_path(params[:item_id])
   end
  end
end
