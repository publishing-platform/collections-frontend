require "rails_helper"

RSpec.describe Organisation do
  let(:api_data) do
    PublishingPlatformSchemas::Example.find("organisation", example_name: "organisation")
  end
  let(:content_item) do
    ContentItem.new(api_data)
  end

  let(:organisation) { described_class.new(content_item) }

  it "returns the organisation title" do
    expect(organisation.title).to eq(api_data["title"])
  end

  it "returns the organisation description" do
    expect(organisation.description).to eq(api_data["description"])
  end

  it "returns the base path" do
    expect(organisation.base_path).to eq(api_data["base_path"])
  end

  it "returns the web url" do
    expect(organisation.web_url).to eq(PublishingPlatformLocation.new.website_root + api_data["base_path"])
  end

  it "returns the organisation abbreviation" do
    expect(organisation.abbreviation).to eq(api_data["details"]["abbreviation"])
  end

  it "returns the organisation type" do
    expect(organisation.organisation_type).to eq(api_data["details"]["organisation_type"])
  end

  describe "#is_live?" do
    it "is true when the organisation is live" do
      expect(organisation.is_live?).to be true
    end

    it "is false when the organisation is closed" do
      api_data["details"]["status"] = "closed"
      expect(organisation.is_live?).to be false
    end
  end

  describe "#is_closed?" do
    it "is false when the organisation is live" do
      expect(organisation.is_closed?).to be false
    end

    it "is true when the organisation is closed" do
      api_data["details"]["status"] = "closed"
      expect(organisation.is_closed?).to be true
    end
  end
end
