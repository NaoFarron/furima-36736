require 'rails_helper'

RSpec.describe "CardRegistrations", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/card_registrations/new"
      expect(response).to have_http_status(:success)
    end
  end

end
