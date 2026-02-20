require "rails_helper"

RSpec.describe OrganisationsApiPresenter do
  let(:results) do
    [
      {
        content_id: "af07d5a5-df63-4ddc-9383-6a666845ebe9",
        title: "Digital Services",
        link: "/organisations/digital-services",
        document_type: "organisation",
        organisation_status: "live",
        organisation_type: "department",
        organisation_abbreviation: "DS",
        id: "af07d5a5-df63-4ddc-9383-6a666845ebe9",
        description: "The home of Digital Services on Publishing Platform.",
        public_timestamp: "2026-01-30T20:41:10+00:00",
        slug: "digital-services",
      }.deep_stringify_keys,
      {
        content_id: "6a69bccb-5ef0-4e70-8ef0-b90c65b5102b",
        title: "Closed organisation: Who Framed Roger Rabbit",
        link: "/organisations/who-framed-roger-rabbit",
        document_type: "organisation",
        organisation_status: "closed",
        organisation_type: "other",
        organisation_abbreviation: "WFRR",
        id: "6a69bccb-5ef0-4e70-8ef0-b90c65b5102b",
        description: "The home of the Who Framed Roger Rabbit enquiry",
        public_timestamp: "2026-01-30T20:41:10+00:00",
        slug: "who-framed-roger-rabbit",
      }.deep_stringify_keys,
    ]
  end

  let(:presenter_wrapped) do
    described_class.new(
      results,
      current_page: 1,
      results_per_page: 20,
      total_results: 2,
      current_url_without_parameters: "http://www.publishing-platform.co.uk/api/organisations",
    )
  end

  let(:presenter_not_wrapped) do
    described_class.new(
      results,
      current_page: 1,
      results_per_page: 20,
      total_results: 1,
      current_url_without_parameters: "http://www.publishing-platform.co.uk/api/organisations",
      wrap_in_results_array: false,
    )
  end

  describe "#present with wrapped results" do
    it "returns a presented result set" do
      paginated_results = presenter_wrapped.present
      expect(paginated_results[:results][0][:title]).to eq("Digital Services")
      expect(paginated_results[:results][0][:details][:slug]).to eq("digital-services")
    end

    it "sets the appropriate title for closed orgs" do
      paginated_results = presenter_wrapped.present
      expect(paginated_results[:results][1][:title]).to eq("Who Framed Roger Rabbit")
    end
  end

  describe "#present without wrapped results" do
    it "returns a presented result set" do
      paginated_results = presenter_not_wrapped.present
      expect(paginated_results[:title]).to eq("Digital Services")
      expect(paginated_results[:details][:slug]).to eq("digital-services")
    end
  end
end
