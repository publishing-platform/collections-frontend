require "active_model"

class ContentStoreOrganisations
  include ActiveModel::Model

  attr_reader :content_item

  def initialize(content_item)
    @content_item = content_item
  end

  def self.find!(base_path)
    content_item = ContentItem.find!(base_path)
    new(content_item)
  end

  def departments
    details["ordered_departments"]
  end

  def all
    @all ||= [
      *departments,
    ]
  end

  def count_by_type(organisation_type)
    details[organisation_type].count
  end

  def category_name_from_type(category_type)
    I18n.t("organisations.type.#{category_type}")
  end

private

  def details
    @content_item.content_item_data["details"]
  end
end
