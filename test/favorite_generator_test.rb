require "test_helper"
require "tmpdir"
require "generators/favorite/favorite_generator"

class FavoriteGeneratorTest < Minitest::Test
  def test_generator_uses_the_running_rails_migration_version
    Dir.mktmpdir do |destination_root|
      FavoriteGenerator.start([], destination_root: destination_root)

      model = File.read(File.join(destination_root, "app/models/favorite.rb"))
      migration_path = Dir[File.join(destination_root, "db/migrate/*_create_favorites.rb")].fetch(0)
      migration = File.read(migration_path)

      assert_includes model, "belongs_to :user, optional: true"
      refute_includes model, "default_scope"
      assert_includes migration, "ActiveRecord::Migration[#{ActiveRecord::Migration.current_version}]"
      assert_includes migration, "polymorphic: true, null: false"
    end
  end
end
