# frozen_string_literal: true

class PortfolioInvestment < ApplicationRecord
  belongs_to :portfolio
  belongs_to :investment

  validates :amount, :share, presence: true
end
