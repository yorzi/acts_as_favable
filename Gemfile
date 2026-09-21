source "https://rubygems.org"

gemspec

rails_version = ENV.fetch("RAILS_VERSION") do
  Gem::Version.new(RUBY_VERSION) < Gem::Version.new("3.2") ? "7.2" : "8.1"
end
gem "rails", "~> #{rails_version}.0"

group :development, :test do
  gem "minitest", "~> 5.0"
  gem "sqlite3", ">= 1.7", "< 3.0"
end
