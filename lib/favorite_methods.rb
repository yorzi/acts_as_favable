module ActsAsFavable
  module Favorite
    
    def self.included(favorite_model)
      favorite_model.extend Finders
      favorite_model.scope :in_order, Proc.new { favorite_model.order('created_at ASC') }
      favorite_model.scope :recent, Proc.new { favorite_model.order('created_at DESC') }
    end
    
    module Finders
      def find_favorites_by_user(user)
        where(["user_id = ?", user.id]).order("created_at DESC")
      end

      def find_favorites_for_favable(favable_str, favable_id)
        where(["favable_type = ? and favable_id = ?", favable_str, favable_id]).order("created_at DESC")
      end

      def find_favable(favable_str, favable_id)
        favable_str.constantize.find(favable_id)
      end
    end
  end
end
