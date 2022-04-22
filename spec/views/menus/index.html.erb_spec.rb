require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  before(:each) do
    Category.create(name: "Category")
    assign(:menus, [
      Menu.create!(
        name: "Name",
        price: 2.5,
        description: "MyText",
        category_id: 1
      ),
      Menu.create!(
        name: "Name",
        price: 2.5,
        description: "MyText",
        category_id: 1
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
