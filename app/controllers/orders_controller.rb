class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  def index
    @orders = Order.where("customer_id = ?", session[:current_customer]["id"])
  end

  def show
    session[:current_order] = @order.id
    @order_details = OrderDetail.where("order_id = ?", params[:id])
  end

  def new
    @order = Order.new
  end

  def edit

  end

  def create
    @order = Order.new(order_params.merge(customer_id: session[:current_customer]["id"]))

    if @order.save
      redirect_to order_url(@order), notice: "Order was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @order.update(order_params)
      redirect_to order_url(@order), notice: "Order was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @order.destroy
    destroy_order_details(@order.id)

    redirect_to orders_url, notice: "Order was successfully destroyed." 
   
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.permit(:total_price, :status)
    end
    
    def destroy_order_details(id)
      order_details = OrderDetail.where("order_id = ?", id)
      order_details.each do |order_detail|
        order_detail.destroy
      end
    end
end
