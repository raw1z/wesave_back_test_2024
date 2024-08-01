# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Operation, type: :model do
  context "validations" do
    subject { create(:operation) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to belong_to(:portfolio) }
  end

  it "ensures that the portfolio is valid" do
    operation = build(
      :operation,
      portfolio: create(:portfolio, kind: "PEA")
    )
    expect(operation).to be_valid

    operation = build(
      :operation,
      portfolio: create(:portfolio, kind: "CTO")
    )
    expect(operation).to be_valid

    operation = build(
      :operation,
      portfolio: create(:portfolio, kind: "Assurance Vie")
    )
    expect(operation).not_to be_valid
  end

  it "ensures that a move target is valid" do
    portfolio = create(:portfolio, kind: "CTO")
    operation = build(
      :operation,
      portfolio:,
      target_id: create(:portfolio, kind: "PEA").id,
      amount: -5000
    )
    expect(operation).to be_valid

    operation = build(
      :operation,
      portfolio:,
      target_id: create(:portfolio, kind: "CTO").id,
      amount: -5000
    )
    expect(operation).to be_valid

    operation = build(
      :operation,
      portfolio:,
      target_id: create(:portfolio, kind: "Assurance Vie").id,
      amount: -5000
    )
    expect(operation).not_to be_valid
  end

  it "ensures that amount is negative when moving" do
    portfolio = create(:portfolio, kind: "CTO")
    target_id = create(:portfolio, kind: "CTO").id
    operation = build(
      :operation,
      portfolio:,
      target_id:,
      amount: -5000
    )
    expect(operation).to be_valid

    operation = build(
      :operation,
      portfolio:,
      target_id:,
      amount: 5000
    )
    expect(operation).not_to be_valid
  end

  context "updates portfolios on created" do
    it "updates without a move target" do
      portfolio = create(:portfolio, kind: "PEA", total_amount: 2500)
      create(:operation, portfolio:, amount: 5000)
      expect(portfolio.reload.total_amount).to eq(7500)
      create(:operation, portfolio:, amount: -2500)
      expect(portfolio.reload.total_amount).to eq(5000)
    end

    it "updates with a move target" do
      portfolio = create(:portfolio, kind: "PEA", total_amount: 10_000)
      other_portfolio = create(:portfolio, kind: "CTO", total_amount: 5_000)

      create(
        :operation,
        portfolio:,
        amount: -5_000,
        target_id: other_portfolio.id
      )

      expect(portfolio.reload.total_amount).to eq(5_000)
      expect(other_portfolio.reload.total_amount).to eq(10_000)
    end
  end
end
