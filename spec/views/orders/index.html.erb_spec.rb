require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    Customer.create(email: "customer@email.com")
    assign(:orders, [
      Order.create!(
        total_price: 2.5,
        status: "Status",
        customer_id: 1
      ),
      Order.create!(
        total_price: 2.5,
        status: "Status",
        customer_id: 1
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
