require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "can input data" do
    Category.create(name: "Kategori1")
    expect(menu = FactoryBot.build(:menu)).to be_valid
  end

  it "is invalid with price lower than 0.01" do
    menu = FactoryBot.build(:invalid_menu)
    menu.valid?

    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end
end
