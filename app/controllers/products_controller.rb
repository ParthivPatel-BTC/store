class ProductsController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @products = @category.products.order(:name).page(params[:page]).per(Settings.defaults.pagination.per_page)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
