require 'rails/generators/migration'

class FavoriteGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @_acts_as_favable_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_model_file
    template "favorite.rb", "app/models/favorite.rb"
    migration_template "create_favorites.rb", "db/migrate/create_favorites.rb"
  end
end
