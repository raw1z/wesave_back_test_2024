# frozen_string_literal: true

class Operation < ApplicationRecord
  belongs_to :portfolio

  validates :amount, presence: true
  validate :portfolio_accepts_operations
  validate :move_target_is_valid
  validate :move_amount_is_negative

  after_create_commit :update_portfolios_on_operation_created

  def move_target
    Portfolio.find_by(id: target_id)
  end

  private

  def portfolio_accepts_operations
    return if %w[PEA CTO].include?(portfolio&.kind)

    errors.add(:portfolio, "invalid target portfolio type")
  end

  def move_target_is_valid
    return unless move_target.present?
    return if %w[PEA CTO].include?(move_target.kind)

    errors.add(:portfolio, "invalid move target portfolio type")
  end

  def move_amount_is_negative
    return unless move_target.present?
    return if amount < 0

    errors.add(:portfolio, "amount must be negative for a move")
  end

  def update_portfolios_on_operation_created
    portfolio.update(
      total_amount: portfolio.total_amount + amount
    )

    return if move_target.nil?
    move_target.update(
      total_amount: move_target.total_amount + amount.abs
    )
  end
end
