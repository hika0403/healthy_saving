require 'rails_helper'

RSpec.describe "Bodies", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/bodies/show"
      expect(response).to have_http_status(:success)
    end
  end

end
