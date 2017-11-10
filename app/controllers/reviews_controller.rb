class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.new(
        description: params[:review][:description],
        rating: params[:review][:rating]
      )
    @review.user = current_user
    if @review.save
      redirect_to product_path(params[:product_id])
    else
      redirect_to [:products]
    end
  end
end