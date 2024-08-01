# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Investment, type: :model do
  it { is_expected.to validate_presence_of(:isin) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:label) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to validate_presence_of(:sri) }
  it { is_expected.to validate_numericality_of(:sri).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(7) }
  it { is_expected.to have_many(:portfolio_investments).dependent(:restrict_with_error) }

  context "uniqueness of isin" do
    subject { create(:investment) }
    it { is_expected.to validate_uniqueness_of(:isin) }
  end
end
