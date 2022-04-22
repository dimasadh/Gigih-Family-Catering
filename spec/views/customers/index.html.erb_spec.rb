require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        email: "MyString1@email.com"
      ),
      Customer.create!(
        email: "MyString2@email.com"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "p", text: "Email:MyString1@email.com".to_s, count: 1
    assert_select "p", text: "Email:MyString2@email.com".to_s, count: 1
  end
end
