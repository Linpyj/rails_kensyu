class ProductsController < ApplicationController
  def index
    @products = Product.all()
    puts(@products.count())
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(name: params[:product][:name])
    redirect_to products_index_path
  end

  def edit
    @product = Product.find_by(id: params[:id])
    puts(@product)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_index_path
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.delete
    redirect_to products_index_path
  end

  private
    def product_params
      params.require(:product).permit(:name)
    end
end
