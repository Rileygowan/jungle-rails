class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @review = Review.find_by(product_id: params[:id])
    @product = Product.find(params[:id])
  end

end
