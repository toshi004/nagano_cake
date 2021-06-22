class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Items.new
  end

  def create
    @item = Items.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

  def show
  end

  def edit
  end

  def update
  end

  priavte

  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :price, :is_active)
  end

end
