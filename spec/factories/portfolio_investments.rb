# frozen_string_literal: true

FactoryBot.define do
  factory :portfolio_investment do
    association :portfolio
    association :investment
    amount { 15000.0 }
    share { 0.2 }
  end
end
