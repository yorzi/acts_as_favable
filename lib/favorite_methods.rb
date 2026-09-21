require "active_support/concern"

module ActsAsFavable
  module Favorite
    extend ActiveSupport::Concern

    included do
      scope :in_order, -> { order(created_at: :asc) }
      scope :recent, -> { order(created_at: :desc) }
    end

    class_methods do
      def find_favorites_by_user(user)
        where(user_id: user.id).recent
      end

      def find_favorites_for_favable(favable_type, favable_id)
        where(favable_type: favable_type, favable_id: favable_id).recent
      end

      def find_favable(favable_type, favable_id)
        ActiveRecord::Base.polymorphic_class_for(favable_type).find(favable_id)
      end
    end
  end
end
