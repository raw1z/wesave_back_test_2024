# frozen_string_literal: true

class Investment < ApplicationRecord
  validates :isin, :kind, :label, :price, :sri, presence: true
  validates :sri, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 7}
end
