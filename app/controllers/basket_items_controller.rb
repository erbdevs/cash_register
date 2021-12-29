class BasketItemsController < ApplicationController
  before_action :set_basket

  def create
    @basket_item = create_basket_item
    unless @basket.persisted?
      @basket.state = "created"
      @basket.client = "Obi Wan"
    end

    @basket.save!
    @basket_items = @basket.basket_items
    session[:basket_id] = @basket.id
  end

  def update
    @basket_item = @basket.basket_items.find(params[:id])
    @basket_item.update_attribute(:quantity, basket_item_params[:quantity])
    @basket_items = current_basket.basket_items
  end

  def destroy
    @basket_item = @basket.basket_items.find(params[:id])
    @basket_item.destroy!
    @basket_items = current_basket.basket_items
  end

private

  def basket_item_params
    params.require(:basket_item).permit(:product_id, :quantity)
  end

  def set_basket
    @basket = current_basket
  end

  def create_basket_item
    basket_item = @basket.basket_items.find_or_create_by(
      product_id: basket_item_params[:product_id]
    )
    basket_item.quantity += basket_item_params[:quantity].to_i
    basket_item.save!

    basket_item
  end
end
