require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      email: "MyString@email.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyString@email.com/)
  end
end
