# frozen_string_literal: true

class Portfolio < ApplicationRecord
  has_many :portfolio_investments, dependent: :restrict_with_error
  belongs_to :customer

  validates :label, :kind, :total_amount, presence: true
end
