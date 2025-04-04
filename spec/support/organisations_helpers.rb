module OrganisationsHelpers
  def departments_hash
    {
      title: "Departments and other organisations",
      details: {
        ordered_departments: [
          {
            href: "/organisations/digital-services",
            slug: "digital-services",
            title: "Digital Services",
            status: "live",
            content_id: "af07d5a5-df63-4ddc-9383-6a666845ebe9",
            abbreviation: "DS",
            organisation_type: "department",
          },
          {
            href: "/organisations/financial-services",
            slug: "financial-services",
            title: "Financial Services",
            status: "live",
            content_id: "80facda2-0957-4652-a52c-5ff78a16b4d3",
            abbreviation: "FS",
            organisation_type: "department",
          },
        ],
      },
    }.with_indifferent_access
  end
end
