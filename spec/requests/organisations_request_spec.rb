require "rails_helper"

RSpec.describe "/organisations", type: :request do
  describe "GET /index" do
    let(:content_item) do
      PublishingPlatformSchemas::Example.find("organisations_homepage", example_name: "organisations_homepage")
    end

    it "returns sucessfully for item in content store" do
      stub_content_store_has_item(content_item["base_path"], content_item.to_json)
      get "/organisations"

      expect(response).to have_http_status(:ok)
    end

    it "returns 404 for item not in content store" do
      stub_content_store_does_not_have_item(content_item["base_path"])

      get "/organisations"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET /show" do
    let(:content_item) do
      PublishingPlatformSchemas::Example.find("organisation", example_name: "organisation")
    end

    it "returns sucessfully for item in content store" do
      stub_content_store_has_item(content_item["base_path"], content_item.to_json)
      get content_item["base_path"]

      expect(response).to have_http_status(:ok)
    end

    it "set correct expiry headers" do
      stub_content_store_has_item(content_item["base_path"], content_item.to_json)
      get content_item["base_path"]

      expect(response.headers["Cache-Control"]).to eq("max-age=900, public")
    end

    it "returns 404 for item not in content store" do
      stub_content_store_does_not_have_item(content_item["base_path"])

      get content_item["base_path"]
      expect(response).to have_http_status(:not_found)
    end
  end
end
