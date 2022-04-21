FactoryBot.define do
  factory :menu do
    name { "MyString" }
    price { 1.5 }
    description { "MyText" }
    id{1}
    category_id{1}
  end

  factory :invalid_menu, parent: :menu do
    name { nil }
    price { 0.005 }
    description { 
      "MyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMy
      TextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTextMyTexta" }
    id{1}
    category_id{1}
  end
end
