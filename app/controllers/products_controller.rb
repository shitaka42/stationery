class ProductsController < ApplicationController
  @products = Product.all.order('id ASC').limit(20)
end
