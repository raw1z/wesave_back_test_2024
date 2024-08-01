# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Investment, type: :model do
  it { is_expected.to validate_presence_of(:isin) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:label) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:sri) }
  it { is_expected.to validate_numericality_of(:sri).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(7) }
end
