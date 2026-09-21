require "bundler/setup"
require "minitest/autorun"
require "active_record"
require "acts_as_favable"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Schema.verbose = false

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string :name
    t.timestamps
  end

  create_table :articles, force: true do |t|
    t.string :type
    t.string :title
    t.timestamps
  end

  create_table :photos, force: true do |t|
    t.string :title
    t.timestamps
  end

  create_table :favorites, force: true do |t|
    t.string :note, limit: 50, default: ""
    t.references :favable, polymorphic: true, null: false, index: true
    t.references :user, null: true, index: true
    t.timestamps
  end
end

class User < ActiveRecord::Base
  has_many :favorites, dependent: :destroy
end

class Article < ActiveRecord::Base
  acts_as_favable
end

class SpecialArticle < Article
end

class Photo < ActiveRecord::Base
  acts_as_favable dependent: :delete_all
end

class Favorite < ActiveRecord::Base
  include ActsAsFavable::Favorite

  belongs_to :favable, polymorphic: true
  belongs_to :user, optional: true
end

class Minitest::Test
  def setup
    Favorite.delete_all
    Article.delete_all
    Photo.delete_all
    User.delete_all
  end
end
