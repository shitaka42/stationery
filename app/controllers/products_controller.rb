class ProductsController < ApplicationController
  
  def index
    @products = Product.all.order('id ASC').limit(20)
  end

  def search
    @products=Product.where('title LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end
end
