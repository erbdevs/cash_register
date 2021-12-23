class BasketItemsController < ApplicationController
  before_action :set_basket

  def create
    @basket_item = @basket.basket_items.new(basket_item_params)
    @basket.save
    session[:basket_id] = @basket.id
  end

  def update
    @basket_item = @basket.basket_items.find(basket_item_params[:id])
    @basket_item.update_attributes(basket_item_params)
    @basket_items = @basket.basket_items
  end

  def destroy
    @basket_item = @basket.basket_items.find(basket_item_params[:id])
    @basket_item.destroy
    @basket_items = @basket.basket_items
  end

private

  def basket_item_params
    params.require(:basket_item).permit(:id, :product_id, :quantity)
  end

  def set_basket
    @basket = current_basket
  end
end
