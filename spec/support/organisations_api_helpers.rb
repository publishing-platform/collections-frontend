module OrganisationsApiHelpers
  def organisations_params(start: "0")
    {
      filter_document_type: "organisation",
      order: "title",
      count: "20",
      start:,
    }
  end

  def organisation_params(slug:)
    {
      filter_document_type: "organisation",
      filter_slug: slug,
      count: "1",
      start: "0",
    }
  end

  def search_api_organisations_results
    {
      results: [digital_services, financial_services],
      total: 2,
      start: 0,
    }.deep_stringify_keys
  end

  def search_api_organisations_many_results
    {
      results: [],
      total: 1000,
      start: 0,
    }.deep_stringify_keys
  end

  def search_api_organisation_results
    {
      results: [digital_services],
      total: 1,
      start: 0,
    }.deep_stringify_keys
  end

  def search_api_organisation_no_results
    {
      results: [],
      total: 0,
      start: 0,
    }.deep_stringify_keys
  end

  def digital_services
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
    }
  end

  def financial_services
    {
      content_id: "80facda2-0957-4652-a52c-5ff78a16b4d3",
      title: "Closed organisation: Financial Services",
      link: "/organisations/financial-services",
      document_type: "organisation",
      organisation_status: "closed",
      organisation_type: "other",
      organisation_abbreviation: "FS",
      id: "80facda2-0957-4652-a52c-5ff78a16b4d3",
      description: "The home of Financial Services on Publishing Platform.",
      public_timestamp: "2025-10-15T15:37:20.000+00:00",
      slug: "financial-services",
    }
  end
end
