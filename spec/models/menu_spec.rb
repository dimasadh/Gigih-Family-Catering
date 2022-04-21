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

  it "is invalid with description's length is greater than 150 characters" do
    menu = FactoryBot.build(:invalid_menu)
    menu.valid?

    expect(menu.errors[:description]).to include("is too long (maximum is 150 characters)")
  end
  subject { FactoryBot.build(:menu) }
  it { should belong_to(:category).class_name('Category') }
end
