require "rails_helper"

RSpec.describe PaginationHelper do
  let(:presented_results) do
    [
      {
        "id": "http://www.dev.publishing-platform.co.uk/api/organisations/digital-services",
        "title": "Digital Services",
        "format": "Department",
        "updated_at": "2015-05-13T11:09:06.000+01:00",
        "web_url": "http://www.dev.publishing-platform.co.uk/organisations/digital-services",
        "details": {
          "slug": "digital-services",
          "abbreviation": "DS",
          "status": "live",
          "content_id": "af07d5a5-df63-4ddc-9383-6a666845ebe9"
        }
      }
    ]
  end
  let(:current_page) { 1 }
  let(:results_per_page) { 20 }

  describe "#paginate with wrapped results" do
    let(:total_results) { 21 } # Do this so we get page numbers in the links
    let(:current_url_without_parameters) { "http://www.dev.publishing-platform.co.uk/api/organisations" }

    it "returns a hash with results and pagination details" do
      paginated_results = paginate(presented_results, true)

      expect(paginated_results[:results]).to eq(presented_results)
      expect(paginated_results[:previous_page_url]).to be_nil
      expect(paginated_results[:next_page_url]).to eq("#{current_url_without_parameters}?page=2")
      expect(paginated_results[:current_page]).to eq(current_page)
      expect(paginated_results[:total]).to eq(total_results)
      expect(paginated_results[:pages]).to eq(2)
      expect(paginated_results[:page_size]).to eq(results_per_page)
      expect(paginated_results[:start_index]).to eq(1)
      # next_page_url
      expect(paginated_results[:_response_info][:links][0][:href]).to eq("#{current_url_without_parameters}?page=2")
      # current_page_url
      expect(paginated_results[:_response_info][:links][1][:href]).to eq("#{current_url_without_parameters}?page=1")
    end
  end

  describe "#paginate without wrapped results" do
    let(:total_results) { 1 }
    let(:current_url_without_parameters) { "https://www.dev.publishing-platform.co.uk/api/organisations/digital-services" }

    it "returns a hash with results and no pagination details" do
      paginated_results = paginate(presented_results, false)

      expect(paginated_results[:title]).to eq("Digital Services")
      expect(paginated_results[:results]).to be_nil
      # current_page_url
      expect(paginated_results[:_response_info][:links][0][:href]).to eq(current_url_without_parameters)
    end
  end
end