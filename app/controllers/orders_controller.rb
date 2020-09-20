class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @items = Item.all
    @item = Item.find(params[:item_id])
    if @item.user.id == current_user.id
      redirect_to root_path
    end
  end
end