require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        email: "Email"
      ),
      Customer.create!(
        email: "Email"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
