require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    Customer.create(email: "customer@email.com")
    @order = assign(:order, Order.create!(
      total_price: 1.5,
      status: "MyString",
      customer_id: 1
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[total_price]"

      assert_select "input[name=?]", "order[status]"
    end
  end
end
