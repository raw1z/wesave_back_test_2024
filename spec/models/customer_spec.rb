# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { is_expected.to have_many(:portfolios).dependent(:restrict_with_error) }
end
