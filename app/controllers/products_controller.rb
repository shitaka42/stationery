class ProductsController < ApplicationController
  
  def index
    @products = Product.all.order('id ASC').limit(20)
  end
end
