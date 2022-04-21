require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid name" do
    expect(category = FactoryBot.build(:category)).to be_valid
  end
end
