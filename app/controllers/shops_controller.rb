class ShopsController < ApplicationController
  def index
    @items = Item.all

    @order_item = current_order.order_items.new
  end

  def show
    @item = Item.find_by(slug: params[:id])
  end
end
