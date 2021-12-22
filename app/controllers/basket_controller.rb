class BasketController < ApplicationController
  def new
    @available_products = Product.all
  end

  def create
  end
end
