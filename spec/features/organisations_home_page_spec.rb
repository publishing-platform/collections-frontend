require "rails_helper"

RSpec.feature "Organisations home page", type: :feature do
  let(:content_item) do
    PublishingPlatformSchemas::Example.find("organisations_homepage", example_name: "organisations_homepage")
  end

  before do
    stub_content_store_has_item(content_item["base_path"], content_item.to_json)
  end

  scenario do
    when_i_visit_the_organisations_home_page
    then_i_see_the_page_title_has_been_set
    and_i_see_breadcrumbs
    and_i_see_links_to_organisations
  end

private

  def when_i_visit_the_organisations_home_page
    visit organisations_path
  end

  def then_i_see_the_page_title_has_been_set
    expect(page).to have_title("Departments and other organisations - Publishing Platform")
    expect(page).to have_selector("h1", text: "Departments and other organisations")
  end

  def and_i_see_breadcrumbs
    within ".breadcrumb" do
      expect(page).to have_link("Home", href: "/")
      expect(page).to have_content("Organisations")
    end
  end

  def and_i_see_links_to_organisations
    expect(page).to have_link("Digital Services", href: "/organisations/digital-services")
  end
end
