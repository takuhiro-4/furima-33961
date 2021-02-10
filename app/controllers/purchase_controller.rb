class PurchaseController < ApplicationController
  def index
    @purchase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    binding.pry
  end
end
