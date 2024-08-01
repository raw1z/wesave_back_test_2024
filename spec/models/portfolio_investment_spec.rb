# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PortfolioInvestment, type: :model do
  it { is_expected.to belong_to(:portfolio) }
  it { is_expected.to belong_to(:investment) }
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:share) }
end
