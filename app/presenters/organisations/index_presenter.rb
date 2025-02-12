module Organisations
  class IndexPresenter
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::UrlHelper

    LISTING_ORDER = %w[
      department
      other
    ].freeze

    def initialize(organisations)
      @organisations = organisations
    end

    def title
      @organisations.content_item.title
    end

    def all_organisations
      {
        departments: @organisations.departments,
      }
    end
  end
end
