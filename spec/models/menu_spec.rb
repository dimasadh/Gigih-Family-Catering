require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "can input data" do
    Category.create(name: "Kategori1")
    expect(menu = FactoryBot.build(:menu)).to be_valid
  end
end
