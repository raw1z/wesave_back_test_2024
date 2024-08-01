# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/customer/:custome_id/portfolios/:portfolio_id/operations", type: :request do
  let(:portfolio) { create(:portfolio, total_amount: 15000) }

  describe "POST /create" do
    it "applies a deposit" do
      post portfolio_operations_url(portfolio),
        params: {amount: 5000.0},
        as: :json
      expect(response).to be_successful
      expect(Operation.count).to eq(1)
      expect(Operation.first.amount).to eq(5000)
      expect(portfolio.reload.total_amount).to eq(20000)
    end

    it "applies a withdraw" do
      post portfolio_operations_url(portfolio),
        params: {amount: -5000.0},
        as: :json
      expect(response).to be_successful
      expect(portfolio.operations.count).to eq(1)
      expect(portfolio.operations.first.amount).to eq(-5000)
      expect(portfolio.reload.total_amount).to eq(10000)
    end

    it "applies a move" do
      other_portfolio = create(:portfolio, total_amount: 5000)

      post portfolio_operations_url(portfolio),
        params: {
          amount: -5000.0,
          target_id: other_portfolio.id,
        },
        as: :json
      expect(response).to be_successful
      expect(portfolio.operations.count).to eq(1)
      expect(portfolio.operations.first.amount).to eq(-5000)
      expect(portfolio.reload.total_amount).to eq(10000)
      expect(other_portfolio.reload.total_amount).to eq(10000)
    end
  end
end
