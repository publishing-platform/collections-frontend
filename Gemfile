source "https://rubygems.org"

gem "rails", "~> 8.1.2"

gem "bootsnap", require: false
gem "dartsass-rails"
gem "jbuilder"
gem "jsbundling-rails"
gem "publishing_platform_api_adapters"
gem "publishing_platform_app_config"
gem "publishing_platform_location"
gem "sprockets-rails"
gem "terser"
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "publishing_platform_rubocop"
  gem "publishing_platform_schemas"
  gem "publishing_platform_test"
  gem "rspec-rails"
  gem "webmock", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "simplecov"
end
