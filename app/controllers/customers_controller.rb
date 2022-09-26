class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy]
  skip_before_action :verify_authenticity_token

  def home
    if session[:current_customer] != nil
      flash[:notice] = "You have been logged in! You can start to order."
    end

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
    @customer = Customer.find_by_email(params[:customer][:email])
    if @customer.present? && @customer.authenticate(params[:customer][:password])
      session[:current_customer] = @customer.email
      redirect_to menus_path
    else
      flash[:alert] = "Invalid email or password"
      redirect_to root_path
    end
  end

  def logout
    if session[:current_customer] != nil
      session[:current_customer] = nil
      flash[:notice] = "You have been logged out! Please log in before you order."
      redirect_to root_path
    else
      redirect_to root_path
    end
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
      params.require(:customer).permit(:email, :password)
    end
end
