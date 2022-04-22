require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    Customer.create(email: "customer@email.com")
    assign(:order, Order.create!(
      total_price: 1.5,
      status: "MyString",
      customer_id: 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[total_price]"

      assert_select "input[name=?]", "order[status]"
    end
  end
end
