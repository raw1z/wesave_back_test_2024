# frozen_string_literal: true

def import_contract(customer, contract)
  portfolio = Portfolio.create(
    label: contract.label,
    kind: contract.type,
    total_amount: contract.amount,
    customer:
  )
  contract.lines&.each do |line_data|
    line = ActiveSupport::OrderedOptions[line_data]
    investment = Investment.find_or_create_by(
      isin: line.isin,
      kind: line.type,
      label: line.label,
      price: line.price,
      sri: line.srri
    )
    PortfolioInvestment.create(
      portfolio:,
      investment:,
      amount: line.amount,
      share: line.share
    )
  end
  puts "Imported: #{contract.label}"
end

customer = Customer.create
File.read("data/level_1/portfolios.json")
  .then { JSON.parse(_1) }
  .then { _1["contracts"].map(&:deep_symbolize_keys) }
  .map { ActiveSupport::OrderedOptions[_1] }
  .each { import_contract(customer, _1) }
