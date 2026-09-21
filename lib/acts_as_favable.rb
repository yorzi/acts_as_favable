require "active_record"
require "active_support"
require "active_support/lazy_load_hooks"

require_relative "acts_as_favable/version"
require_relative "favable_methods"
require_relative "favorite_methods"

ActiveSupport.on_load(:active_record) do
  include Acts::Favable unless ancestors.include?(Acts::Favable)
end
