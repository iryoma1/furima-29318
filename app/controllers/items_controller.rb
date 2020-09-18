class ItemsController < ApplicationController
  before_action :current_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [ :new, :create ,:edit]


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user.id == current_user.id
      render action: :edit
    else
      render action: :show
    end
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render action: :show
    end
  end
  def show
    @item = Item.find(params[:id])
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
