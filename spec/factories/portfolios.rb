# frozen_string_literal: true

FactoryBot.define do
  factory :portfolio do
    label { "Portefeuille d'actions" }
    kind { "CTO" }
    association :customer
  end
end
