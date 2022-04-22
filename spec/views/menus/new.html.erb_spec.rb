require 'rails_helper'

RSpec.describe "menus/new", type: :view do
  before(:each) do
    Category.create(name: "Category")
    assign(:menu, Menu.create!(
      name: "MyString",
      price: 1.5,
      description: "MyText",
      category_id: 1
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input[name=?]", "menu[name]"

      assert_select "input[name=?]", "menu[price]"

      assert_select "textarea[name=?]", "menu[description]"
    end
  end
end
