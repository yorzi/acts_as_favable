require "active_record"
require "rails/generators"
require "rails/generators/migration"

class FavoriteGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path("templates", __dir__)

  def self.next_migration_number(dirname)
    if ActiveRecord.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      format("%.3d", current_migration_number(dirname) + 1)
    end
  end

  def create_favorite_files
    template "favorite.rb", "app/models/favorite.rb"
    migration_template "create_favorites.rb", "db/migrate/create_favorites.rb"
  end
end
