FactoryBot.define do
  factory :customer do
    email { "MyString@email.com" }
  end

  factory :invalid_customer, parent: :customer do
    email { "MyString@email" }
  end
end
