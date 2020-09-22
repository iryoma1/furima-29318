class OrdersController < ApplicationController
  before_action :set_order, onry: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order = Order.new
    redirect_to root_path if @item.user.id == current_user.id || @item.purchase.present?
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :city_block, :building, :phone_number, :purchase_id, :user_id, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
