# frozen_string_literal: true

class PortfoliosController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @portfolios = @customer
      .portfolios
      .includes(portfolio_investments: :investment)
  end
end
