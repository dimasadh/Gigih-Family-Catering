require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    Customer.create(email: "customer@email.com")
    @order = assign(:order, Order.create!(
      total_price: 1.5,
      status: "MyString",
      customer_id: 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Status/)
  end
end
