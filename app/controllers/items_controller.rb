class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :abc, only: :edit
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :kategory_id, :state_id, :burden_id, :area_id, :sipping_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def abc
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id 
      redirect_to action: :index
    end
  end

end
