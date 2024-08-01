# frozen_string_literal: true

FactoryBot.define do
  factory :operation do
    amount { 9.99 }
    association :portfolio
  end
end
