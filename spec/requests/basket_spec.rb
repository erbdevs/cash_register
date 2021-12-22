require 'rails_helper'

RSpec.describe "Baskets", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/basket/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/basket/create"
      expect(response).to have_http_status(:success)
    end
  end

end
