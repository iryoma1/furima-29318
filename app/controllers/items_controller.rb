class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :new]


  def index
    @items = Item.all
  end

  def new
    @items = Item.new
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
    params.require(:item).permit(:name, :description, :category_id)
  end



end
