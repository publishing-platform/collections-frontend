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
      search_api.search(params).to_h
    end
  end

  def self.search_api
    @search_api ||= PublishingPlatformApi.search
  end
end
