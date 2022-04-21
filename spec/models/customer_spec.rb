require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "has a valid email" do
    expect(customer = FactoryBot.build(:customer)).to be_valid
  end

  it "is invalid without a valid email" do
    expect(customer = FactoryBot.build(:invalid_customer)).to be_invalid
  end

  it "is invalid with duplicated email" do
    customer1 = Customer.create(email: "halo@gmail.com")
    customer2 = Customer.create(email: "halo@gmail.com")
    customer2.valid?

    expect(customer2.errors[:email]).to include("has already been taken")
  end

  it "is invalid without a name" do
    customer = Category.create(:email => nil)
    customer.valid?

    expect(customer.errors[:email]).to include("can't be blank")
  end 
end
