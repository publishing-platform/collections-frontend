require "active_model"

class Organisation
  include ActiveModel::Model

  attr_reader :content_item

  def initialize(content_item)
    @content_item = content_item
  end

  def self.find!(base_path)
    content_item = ContentItem.find!(base_path)
    new(content_item)
  end

  def title
    @content_item.content_item_data["title"]
  end

  def description
    @content_item.content_item_data["description"]
  end

  def abbreviation
    details["abbreviation"]
  end

  def organisation_type
    details["organisation_type"]
  end

  def web_url
    PublishingPlatformLocation.new.website_root + base_path
  end

  def base_path
    @content_item.content_item_data["base_path"]
  end

  def is_live?
    details["status"] == "live"
  end

  def is_closed?
    details["status"] == "closed"
  end

private

  def links
    @content_item.content_item_data["links"]
  end

  def details
    @content_item.content_item_data["details"]
  end
end
