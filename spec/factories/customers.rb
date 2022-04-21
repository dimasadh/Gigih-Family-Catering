FactoryBot.define do
  factory :customer do
    email { "MyString@email.com" }
    id {1}
  end

  factory :invalid_customer, parent: :customer do
    email { "halo@gigih" }
    id{1}
  end
end
