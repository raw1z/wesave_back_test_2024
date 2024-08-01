# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/customers", type: :request do
  let(:customer) { create(:customer) }

  describe "GET /index" do
    it "renders a successful response" do
      get customers_url, as: :json
      expect(response).to be_successful
    end
  end
end
