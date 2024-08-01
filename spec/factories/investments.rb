FactoryBot.define do
  factory :investment do
    isin { "MyString" }
    kind { "MyString" }
    label { "MyString" }
    price { "9.99" }
    sri { 1 }
  end
end
