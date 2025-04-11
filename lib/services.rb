require "publishing_platform_api/content_store"
require "publishing_platform_api/publishing_api"

module Services
  def self.content_store
    @content_store ||= PublishingPlatformApi::ContentStore.new(
      PublishingPlatformLocation.new.find("content-store"),
    )
  end

  def self.cached_search(params, expires_in: 5.minutes)
    Rails.cache.fetch(params, expires_in:) do
      # search_api.search(params).to_h
      ds = content_store.content_item("/organisations/digital-services")
      result = {
        results: [
          {
            organisations: [
              {
                title: ds["title"],
                organisation_type: ds["details"]["organisation_type"],
                status: ds["details"]["status"],
                abbreviation: ds["details"]["abbreviation"],
                content_id: ds["content_id"],
                link: ds["base_path"],
                slug: ds["base_path"].split("/").last,
                public_timestamp: ds["public_updated_at"],
              },
            ],
          },
        ],
        total: 1,
        start: 0,
      }
      result
    end
  end

  # TODO: uncomment when search api is available
  # def self.search_api
  #   @search_api ||= PublishingPlatformApi.search
  # end
end
