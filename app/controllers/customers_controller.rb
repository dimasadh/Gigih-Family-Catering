class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy]
  skip_before_action :verify_authenticity_token

  def home
    @customers = Customer.all
  end 

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def set_current_customer
    @customer = Customer.find(params[:customer][:id])
    session[:current_customer] = @customer
    redirect_to menus_path
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      session[:current_customer] = @customer
      redirect_to customer_url(@customer), notice: "Customer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_url(@customer), notice: "Customer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: "Customer was successfully destroyed."
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:email)
    end
end
