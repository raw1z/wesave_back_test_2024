# frozen_string_literal: true

FactoryBot.define do
  factory :investment do
    isin { "FR0000120172" }
    kind { "stock" }
    label { "Apple Inc." }
    price { 150.0 }
    sri { 6 }
  end
end
