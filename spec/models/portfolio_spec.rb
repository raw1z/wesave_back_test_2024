# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it { is_expected.to validate_presence_of(:label) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:total_amount) }
  it { is_expected.to have_many(:portfolio_investments).dependent(:restrict_with_error) }
  it { is_expected.to belong_to(:customer) }
end
