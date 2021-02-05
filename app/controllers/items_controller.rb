class ItemsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :kategory_id, :state_id, :burden_id, :area_id, :sipping_id, :price).merge(user_id: current_user.id)
  end

end
