class Favorite < ApplicationRecord

  include ActsAsFavable::Favorite

  belongs_to :favable, polymorphic: true

  default_scope { order('created_at ASC') }

  # NOTE: Favorite belongs to a user
  belongs_to :user
end
