require "rails_helper"

RSpec.describe "Organisations", type: :system do
  before do
    stub_content_store_has_item(content_item["base_path"], content_item.to_json)
  end

  context "when accessing the organisations homepage" do
    let(:content_item) do
      PublishingPlatformSchemas::Example.find("organisations_homepage", example_name: "organisations_homepage")
    end

    it "sets the page title" do
      visit organisations_path
      expect(page).to have_title("Departments and other organisations - Publishing Platform")
      expect(page).to have_selector("h1", text: "Departments and other organisations")
    end

    it "displays breadcrumbs" do
      visit organisations_path

      within ".breadcrumb" do
        expect(page).to have_link("Home", href: "/")
        expect(page).to have_content("Organisations")
      end
    end

    it "displays links to organisations" do
      visit organisations_path
      expect(page).to have_link("Digital Services", href: "/organisations/digital-services")
    end
  end

  context "when accessing an organisation page" do
    let(:content_item) do
      PublishingPlatformSchemas::Example.find("organisation", example_name: "organisation")
    end

    it "sets the page title" do
      visit content_item["base_path"]
      expect(page).to have_title("#{content_item['title']} - Publishing Platform")
      expect(page).to have_selector("h1", text: content_item["title"])
    end

    it "displays breadcrumbs" do
      visit content_item["base_path"]

      within ".breadcrumb" do
        expect(page).to have_link("Home", href: "/")
        expect(page).to have_link("Organisations", href: organisations_path)
        expect(page).to have_content(content_item["title"])
      end
    end
  end
end
