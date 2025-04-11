require "rails_helper"

RSpec.describe OrganisationHelper do
  describe "#organisation_type_name" do
    it "returns a human-readable name given an organisation_type" do
      expect(organisation_type_name("department")).to eq("Department")
    end

    it "returns 'other' for an unrecognised organisation_type" do
      expect(organisation_type_name("something_else")).to eq("Other")
    end
  end
end
