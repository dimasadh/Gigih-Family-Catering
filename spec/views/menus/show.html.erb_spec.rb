require 'rails_helper'

RSpec.describe "menus/show", type: :view do
  before(:each) do
    Category.create(name: "Category")
    @menu = assign(:menu, Menu.create!(
      name: "MyString",
      price: 1.5,
      description: "MyText",
      category_id: 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/MyText/)
  end
end
