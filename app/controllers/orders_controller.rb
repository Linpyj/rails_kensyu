class OrdersController < ApplicationController
  def index
    # @orders = Order.all()
    # @orders = Order.joins(
    #  "
    #  JOIN
    #     products
    #   ON
    #     products.id = orders.product_id
    #   "
    # )
    # @products = Product.joins(:orders).where(orders: { customer_id: @id }).select("products.*")
    
    # @products = Product.joins(:orders).select("products.*").order(:id)
    # @customers = Customer.joins(:orders).select("customers.*").order(:id)

    # @products = Product.joins(:orders).joins(:customer).select("products.*").order(:id)
    # @customers = Customer.joins(:orders).select("customers.*").order(:id)
    @orders = Order.joins(:product).joins(:customer).select("products.name as p_name, customers.name as c_name").order(:id)
    puts(@orders)
    return @orders
  end

  def new
    @order = Order.new
    @customer_id = params[:id]

    # テスト
    @products = Product.all()

    puts(@customer_id)
    return @order, @customer_id, @products
  end

  def create
    @customer_id = params[:order][:customer_id]
    @product_id = params[:selected]
    Order.create(
      product_id: @product_id,
      customer_id: @customer_id,
    )
    redirect_to orders_index_path
  end
end
