class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


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

  end




end
