# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it { is_expected.to validate_presence_of(:label) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_presence_of(:total_amount) }
end
