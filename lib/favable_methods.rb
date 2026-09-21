require "active_support/concern"

module Acts
  module Favable
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_favable(options = {})
        association_options = { as: :favable, dependent: :destroy }.merge(options)
        has_many :favorites, **association_options

        include Acts::Favable::InstanceMethods
        extend Acts::Favable::SingletonMethods
      end
    end

    module SingletonMethods
      def find_favorites_for(record)
        Favorite.find_favorites_for_favable(polymorphic_name, record.id)
      end

      def find_favorites_by_user(user)
        Favorite.where(user_id: user.id, favable_type: polymorphic_name).recent
      end
    end

    module InstanceMethods
      def favorites_ordered_by_submitted
        Favorite.find_favorites_for_favable(self.class.polymorphic_name, id)
      end

      def add_favorite(favorite)
        favorites << favorite
      end
    end
  end
end
