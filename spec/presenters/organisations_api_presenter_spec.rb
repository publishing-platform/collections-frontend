require "rails_helper"

RSpec.describe OrganisationsApiPresenter do
  let(:results) do
    [
      {
        description: "The home of Digital Services on Publishing Platform.",
        format: "organisation",
        link: "/organisations/digital-services",
        organisations: [
          {
            abbreviation: "DS",
            link: "/organisations/digital-services",
            public_timestamp: "2015-05-13T11:09:06.000+01:00",
            title: "Digital Services",
            content_id: "af07d5a5-df63-4ddc-9383-6a666845ebe9",
            slug: "digital-services",
            organisation_type: "department",
            status: "live",
          },
        ],
        public_timestamp: "2015-05-13T11:09:06.000+01:00",
        slug: "digital-services",
        title: "Digital Services",
        index: "organisation",
        es_score: nil,
        _id: "/organisations/digital-services",
        elasticsearch_type: "edition",
        document_type: "edition",
      },
      {
        description: "The home of the Who Framed Roger Rabbit enquiry",
        format: "organisation",
        link: "/organisations/who-framed-roger-rabbit",
        organisations: [
          {
            abbreviation: "WFRR",
            link: "/organisations/who-framed-roger-rabbit",
            public_timestamp: "2015-05-13T11:09:06.000+01:00",
            title: "Closed organisation: Who Framed Roger Rabbit",
            content_id: "6667cce2-e809-4e21-ae09-cb0bdc1ddda3",
            slug: "who-framed-roger-rabbit",
            organisation_type: "other",
            status: "closed",
          },
        ],
        public_timestamp: "2015-05-13T11:09:06.000+01:00",
        slug: "who-framed-roger-rabbit",
        title: "Closed organisation: Who Framed Roger Rabbit",
        index: "organisation",
        es_score: nil,
        _id: "/organisations/who-framed-roger-rabbit",
        elasticsearch_type: "edition",
        document_type: "edition",
      },
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
