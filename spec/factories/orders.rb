FactoryBot.define do
  factory :order do
    total_price { 1.5 }
    status { "MyString" }
    customer_id {1}
  end
end
