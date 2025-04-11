module OrganisationsApiHelpers
  def organisations_params(start: "0")
    {
      filter_format: "organisation",
      order: "title",
      count: "20",
      start:,
    }
  end
end
