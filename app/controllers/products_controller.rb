class ProductsController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @products = @category.products.order(:name).order(created_at: :desc).page(params[:page] || 1).per(5)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
