class ReportsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
    end

    def todays_report
        @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end

    def report_by_date_range
        @orders = Order.where(created_at: order_params[:start_date]..order_params[:end_date])
    end

    def report_by_customer
        @orders = Order.where(customer_id: order_params[:customer][:id])
    end

    def report_by_greater_than
        @orders = Order.where("total_price > ?", order_params[:price]).order(total_price: :desc)
    end

    def report_by_lower_than
        @orders = Order.where("total_price < ?", order_params[:price]).order(total_price: :asc)
    end 

    def order_params
        params.permit(:email, :price, :start_date, :end_date, customer: [:id])
    end
end
