class ProductsController < ApplicationController
  def index
    @available_products = Product.all
  end
end
