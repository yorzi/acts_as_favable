require 'active_record'

module Acts #:nodoc:
  module Favable #:nodoc:

    def self.included(base)
      base.extend ClassMethods  
    end

    module ClassMethods
      def acts_as_favable(options={})
        has_many :favorites, as: :favable, dependent: :destroy, **options
        include Acts::Favable::InstanceMethods
        extend Acts::Favable::SingletonMethods
      end
    end
    
    module SingletonMethods
      def find_favorites_for(obj)
        favable = self.name
        Favorite.find_favorites_for_favable(favable, obj.id)
      end
      
      def find_favorites_by_user(user) 
        favable = self.name
        Favorite.where(["user_id = ? and favable_type = ?", user.id, favable]).order("created_at DESC")
      end
    end
    
    # This module contains instance methods
    module InstanceMethods
      def favorites_ordered_by_submitted
        Favorite.find_favorites_for_favable(self.class.name, id)
      end

      def add_favorite(favorite)
        favorites << favorite
      end
    end
    
  end
end

ActiveRecord::Base.send(:include, Acts::Favable)
