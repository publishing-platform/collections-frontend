require "rails_helper"

RSpec.feature "Organisation", type: :feature do
  let(:content_item) do
    PublishingPlatformSchemas::Example.find("organisation", example_name: "organisation")
  end

  before do
    stub_content_store_has_item(content_item["base_path"], content_item.to_json)
  end

  scenario do
    when_i_visit_the_organisation_page
    then_i_see_the_page_title_has_been_set
    and_i_see_breadcrumbs
  end

private

  def when_i_visit_the_organisation_page
    visit content_item["base_path"]
  end

  def then_i_see_the_page_title_has_been_set
    expect(page).to have_title("#{content_item['title']} - Publishing Platform")
    expect(page).to have_selector("h1", text: content_item["title"])
  end

  def and_i_see_breadcrumbs
    within ".breadcrumb" do
      expect(page).to have_link("Home", href: "/")
      expect(page).to have_link("Organisations", href: organisations_path)
      expect(page).to have_content(content_item["title"])
    end
  end
end
