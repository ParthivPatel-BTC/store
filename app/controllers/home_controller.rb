class HomeController < ApplicationController
  def index
    @categories = Category.order(:title)
  end

  def categorized_products
    @category = Category.find_by(id: params[:category_id])
    @products = @category.products.order(:name).order(created_at: :desc).page(params[:page] || 1).per(5)
  end

  def product_details
    @product = Product.find_by(id: params[:product_id])
  end
end
