require "rails_helper"

RSpec.describe ContentStoreOrganisations do
  include OrganisationsHelpers

  subject(:content_store_organisations) { described_class.new(ContentItem.new(departments_hash)) }

  describe "#all" do
    it "returns all organisations" do
      all_organisations = [
        {
          href: "/organisations/digital-services",
          slug: "digital-services",
          title: "Digital Services",
          status: "live",
          content_id: "af07d5a5-df63-4ddc-9383-6a666845ebe9",
          abbreviation: "DS",
          organisation_type: "department",
        }.with_indifferent_access,
        {
          href: "/organisations/financial-services",
          slug: "financial-services",
          title: "Financial Services",
          status: "live",
          content_id: "80facda2-0957-4652-a52c-5ff78a16b4d3",
          abbreviation: "FS",
          organisation_type: "department",
        }.with_indifferent_access,
      ]
      expect(content_store_organisations.all).to eq(all_organisations)
    end
  end

  describe "#departments" do
    it "returns all departments" do
      departments = [
        {
          href: "/organisations/digital-services",
          slug: "digital-services",
          title: "Digital Services",
          status: "live",
          content_id: "af07d5a5-df63-4ddc-9383-6a666845ebe9",
          abbreviation: "DS",
          organisation_type: "department",
        }.with_indifferent_access,
        {
          href: "/organisations/financial-services",
          slug: "financial-services",
          title: "Financial Services",
          status: "live",
          content_id: "80facda2-0957-4652-a52c-5ff78a16b4d3",
          abbreviation: "FS",
          organisation_type: "department",
        }.with_indifferent_access,
      ]
      expect(content_store_organisations.departments).to eq(departments)
    end
  end
end
