require "rails_helper"

# TODO: refactor once Search API is available
RSpec.describe "/api/organisations", type: :request do
  describe "GET /index" do
    let(:content_item) do
      PublishingPlatformSchemas::Example.find("organisation", example_name: "organisation")
    end

    before do
      stub_search(params: organisations_params, body: search_api_organisations_results)
      paginated = organisations_params(start: "20")
      stub_search(params: paginated, body: search_api_organisations_many_results)
      stub_content_store_has_item(content_item["base_path"], content_item.to_json)
    end

    it "returns successfully" do
      get api_organisations_path
      expect(response.status).to eq(200)
    end

    it "renders JSON" do
      get api_organisations_path

      body = JSON.parse(response.body)
      expect(body["results"].count).to eq(2)
      expect(body["results"][0]["title"]).to eq("Digital Services")
    end

    it "paginates the results" do
      get api_organisations_path
      body = JSON.parse(response.body)

      expect(body["current_page"]).to eq(1)
      expect(body["_response_info"]["status"]).to eq("ok")
    end

    it "sets the Link HTTP header" do
      get api_organisations_path, params: { page: 2 }
      link = "<http://www.example.com/api/organisations?page=1>; rel=\"previous\", <http://www.example.com/api/organisations?page=3>; rel=\"next\", <http://www.example.com/api/organisations?page=2>; rel=\"self\""
      expect(response.headers["Link"]).to eq(link)
    end
  end
end
