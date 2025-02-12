Rails.application.routes.draw do
  get "/healthcheck/live", to: proc { [200, {}, %w[OK]] }

  get "/organisations",
      to: "organisations#index",
      as: :organisations
  get "/organisations/:organisation_name",
      to: "organisations#show",
      as: :organisation

  scope :api, defaults: { format: :json } do
    get "/organisations",
        to: "organisations_api#index",
        as: :api_organisations
    get "/organisations/:organisation_name",
        to: "organisations_api#show",
        as: :api_organisation

    get "/organisations/*other_route", to: proc { [404, {}, ["404 error"]] }
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
