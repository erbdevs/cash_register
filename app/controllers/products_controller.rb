class ProductsController < ApplicationController
  def index
    @available_products = Product.all
    @basket_item = current_basket.basket_items.new
  end
end
