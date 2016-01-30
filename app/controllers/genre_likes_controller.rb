class GenreLikesController < ApplicationController
  def genre_like
    product = Product.find(params[:product_id])
    # @like_total=Genre_likes.where(genre_type: 1).group(product_id).count(genre_type)
    genre_like = current_user.genre_likes.build(product_id: product.id, genre_type:params[:genre_type])
    genre_like.save
    redirect_to controller: :products, action: :show, id: product.id
  end
end
