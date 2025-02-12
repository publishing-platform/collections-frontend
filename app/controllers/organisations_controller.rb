class OrganisationsController < ApplicationController
  skip_before_action :set_expiry
  before_action do
    set_expiry content_item.max_age, public_cache: content_item.public_cache
  end

  def index
    @organisations = ContentStoreOrganisations.find!("/organisations")
    @presented_organisations = presented_organisations
    setup_content_item_and_navigation_helpers(@organisations)
  end

  def show
    @organisation = Organisation.find!(request.path)
    setup_content_item_and_navigation_helpers(@organisation)
  end

private

  def presented_organisations
    @presented_organisations ||= Organisations::IndexPresenter.new(@organisations)
  end
end
