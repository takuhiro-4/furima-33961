class PrecordsController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postalc, :prefecture_id, :municipality, :address, :building, :phonen, :price, :user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
