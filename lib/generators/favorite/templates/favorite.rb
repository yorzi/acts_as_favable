class Favorite < ApplicationRecord
  include ActsAsFavable::Favorite

  belongs_to :favable, polymorphic: true
  belongs_to :user, optional: true
end
