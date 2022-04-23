class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: %i[ show edit update destroy ]

  def index
    if session[:current_order] == nil
      redirect_to orders_url
    end
    @order_details = OrderDetail.where("order_id = ?", session[:current_order])
  end

  def show
  end

  def new
    if session[:current_customer].present?
      @order_detail = OrderDetail.new
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def create
    @order_detail = OrderDetail.new(prepared_order_details_params)

    if @order_detail.save
      if update_order_total_price
        redirect_to order_detail_url(@order_detail), notice: "Order detail was successfully created."
      else
        redirect_to order_detail_url(@order_detail), notice: "Order detail could not be created. Something wrong with Order counting price"
      end
    else
      render :new, status: :unprocessable_entity
    end
  
  end

  def update
    if @order_detail.update(prepared_order_details_params)
      if update_order_total_price
        redirect_to order_detail_url(@order_detail), notice: "Order detail was successfully updated."
      else
        redirect_to order_detail_url(@order_detail), notice: "Order detail could not be created. Something wrong with Order counting price" 
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order_detail.destroy

    if update_order_total_price
      redirect_to order_details_url, notice: "Order detail was successfully destroyed."
    else
      redirect_to order_detail_url(@order_detail), notice: "Order detail could not be created. Something wrong with Order counting price" 
    end
  end

  private
    def set_order_detail
      @order_detail = OrderDetail.find(params[:id])
    end

    def order_detail_params
      params.require(:order_detail).permit(:menu_id, :order_id, :quantity, :menu_price)
    end

    def sum_menu_price(price)
      price * order_detail_params[:quantity].to_f
    end

    def prepared_order_details_params
      menu = Menu.find(order_detail_params[:menu_id])
      sum_price = sum_menu_price(menu.price)
      return order_detail_params.merge(order_id: session[:current_order], 
        menu_price:menu.price, sum_price:sum_price)
    end

    def update_order_total_price
      order = Order.find(session[:current_order])
      order_details = OrderDetail.where("order_id = ?", order.id)
      order.total_price = 0.0
      order_details.each do |order_detail|
        order.total_price += order_detail.sum_price
      end
      if order.update({"total_price": order.total_price})
        return true
      else
        return false
      end
    end
    
end
