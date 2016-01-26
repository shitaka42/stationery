class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to controller: :products, acion: :index
  end

  private
  def create_params
    params.require(:review).permit(:total_rate, :use_rate, :design_rate, :cp_rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
