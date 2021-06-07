class CustomersController < ApplicationController
  def index
    @customers = Customer.all()
    return @customers
  end

  def new
    @customer = Customer.new
    return @customer
  end

  def create
    Customer.create(name: params[:customer][:name])
    redirect_to customers_index_path
  end

  def edit
    @customer = Customer.find_by(id: params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_index_path
  end

  def show
    @customer = Customer.find_by(id: params[:id])
    @products = Product.where(customers_id: params[:id])
    @id = params[:id]
    @products = Product.joins(:orders).where(orders: { customer_id: @id }).select("products.*")
    return @customer, @products
  end

  def destroy
    @customer = Customer.find_by(id: params[:id])
    @customer.delete
    redirect_to customers_index_path
  end

  private
    def customer_params
      params.require(:customer).permit(:name)
    end
end
