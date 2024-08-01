# frozen_string_literal: true

json.contracts @portfolios do |portfolio|
  json.label portfolio.label
  json.type portfolio.kind
  json.amount portfolio.total_amount.to_f
  json.lines portfolio.portfolio_investments do |portfolio_investment|
    json.type portfolio_investment.investment.kind
    json.isin portfolio_investment.investment.isin
    json.label portfolio_investment.investment.label
    json.price portfolio_investment.investment.price.to_f
    json.share portfolio_investment.share.to_f
    json.amount portfolio_investment.amount.to_f
    json.srri portfolio_investment.investment.sri
  end
end
