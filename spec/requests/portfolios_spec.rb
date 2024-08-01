# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/customer/:id/portfolios", type: :request do
  let(:portfolio) { create(:portfolio) }
  let(:investment) { create(:investment) }
  let!(:portfolio_investment) { create(:portfolio_investment, portfolio:, investment:) }

  describe "GET /index" do
    it "renders a successful response" do
      get customer_portfolios_url(portfolio.customer), as: :json
      expect(response).to be_successful
      json = JSON.parse(response.body)
      expect(json).to eq({
        "contracts" => [
          {
            "label" => "Portefeuille d'actions",
            "type" => "CTO",
            "amount" => 0.0,
            "lines" => [
              {
                "type" => "stock",
                "isin" => "FR0000120172",
                "label" => "Apple Inc.",
                "price" => 150.0,
                "share" => 0.2,
                "amount" => 15000.0,
                "srri" => 6,
              },
            ],
          },
        ],
      })
    end
  end
end
