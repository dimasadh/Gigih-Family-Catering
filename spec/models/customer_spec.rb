require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "has a valid email" do
    expect(customer = FactoryBot.build(:customer)).to be_valid
  end
end
