# frozen_string_literal: true

class Investment < ApplicationRecord
  has_many :portfolio_investments, dependent: :restrict_with_error

  validates :isin, :kind, :label, :price, :sri, presence: true
  validates :isin, uniqueness: true
  validates :sri, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 7}
end
