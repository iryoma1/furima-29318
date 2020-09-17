class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [ :show, :new, :create ]


  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shopping_cost_id, :area_id, :shopping_day_id, :price, :user_id, :image).merge(user_id: current_user.id)
  end



end
