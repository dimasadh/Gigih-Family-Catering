require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid name" do
    expect(category = FactoryBot.build(:category)).to be_valid
  end

  it "is invalid with a duplicate name" do
    category1 = Category.create(:name => "makanan")
    category2 = Category.create(:name => "makanan")
    category2.valid?

    expect(category2.errors[:name]).to include("has already been taken")
  end

  it "is invalid without a name" do
    category = Category.create(:name => nil)
    category.valid?

    expect(category.errors[:name]).to include("can't be blank")
  end 
end
