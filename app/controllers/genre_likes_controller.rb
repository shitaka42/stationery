class GenreLikesController < ApplicationController
  def genre_like
    product = Product.find(params[:product_id])
    genre_like = current_user.genre_likes.build(product_id: product.id, genre_type:params[:genre_type])
    genre_like.save
    redirect_to controller: :products, action: :show, id: product.id
  end
end
