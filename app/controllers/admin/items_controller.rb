class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @item = Items.new
  end

  def create
    @item = Items.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  priavte

  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active)
  end

end
