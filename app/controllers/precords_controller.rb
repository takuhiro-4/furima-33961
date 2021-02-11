class PrecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :no_shipping_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postalc, :prefecture_id, :municipality, :address, :building, :phonen, :price).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def no_shipping_item
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user.id == @item.user_id || @item.precord.present?
  end
end
