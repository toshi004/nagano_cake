class Public::HomesController < ApplicationController

  def top
    @items = Item.limit(4).order("created_at DESC")
  end

end
