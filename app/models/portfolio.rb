# frozen_string_literal: true

class Portfolio < ApplicationRecord
  validates :label, :kind, :total_amount, presence: true
end
