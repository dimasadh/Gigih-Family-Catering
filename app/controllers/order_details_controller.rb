class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: %i[ show edit update destroy ]

  # GET /order_details or /order_details.json
  def index
    if session[:current_order] == nil
      redirect_to orders_url
    end
    @order_details = OrderDetail.where("order_id = ?", session[:current_order])
  end

  # GET /order_details/1 or /order_details/1.json
  def show
  end

  # GET /order_details/new
  def new
    @order_detail = OrderDetail.new
  end

  # GET /order_details/1/edit
  def edit
  end

  # POST /order_details or /order_details.json
  def create
    @order_detail = OrderDetail.new(prepared_order_details_params)

    respond_to do |format|
      if @order_detail.save
        if update_order_total_price
          format.html { redirect_to order_detail_url(@order_detail), notice: "Order detail was successfully created." }
          format.json { render :show, status: :created, location: @order_detail }
        else
          format.html { redirect_to order_detail_url(@order_detail), notice: "Order detail could not be created. Something wrong with Order counting price" }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_details/1 or /order_details/1.json
  def update
    respond_to do |format|
      if @order_detail.update(prepared_order_details_params)
        if update_order_total_price
          format.html { redirect_to order_detail_url(@order_detail), notice: "Order detail was successfully updated." }
          format.json { render :show, status: :ok, location: @order_detail }
        else
          format.html { redirect_to order_detail_url(@order_detail), notice: "Order detail could not be created. Something wrong with Order counting price" }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1 or /order_details/1.json
  def destroy
    @order_detail.destroy

    respond_to do |format|
      if update_order_total_price
        format.html { redirect_to order_details_url, notice: "Order detail was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to order_detail_url(@order_detail), notice: "Order detail could not be created. Something wrong with Order counting price" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = OrderDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
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
