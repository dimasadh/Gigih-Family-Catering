class ReportsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
    end

    def todays_report
        @orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    end

    def order_params
        params.permit(:email, :price_limit, :start_date, :end_date)
    end
end
