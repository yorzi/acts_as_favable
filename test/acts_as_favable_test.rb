require "test_helper"

class ActsAsFavableTest < Minitest::Test
  def test_macro_defines_polymorphic_favorites_association
    reflection = Article.reflect_on_association(:favorites)

    assert_equal :favable, reflection.options[:as]
    assert_equal :destroy, reflection.options[:dependent]
  end

  def test_macro_preserves_custom_association_options
    reflection = Photo.reflect_on_association(:favorites)

    assert_equal :delete_all, reflection.options[:dependent]
  end

  def test_add_favorite_associates_and_persists_a_favorite
    article = Article.create!(title: "Rails")
    favorite = Favorite.new(note: "Useful")

    article.add_favorite(favorite)

    assert_predicate favorite, :persisted?
    assert_equal article, favorite.reload.favable
  end

  def test_destroying_a_favable_destroys_favorites_by_default
    article = Article.create!(title: "Rails")
    favorite = article.favorites.create!(note: "Useful")

    article.destroy!

    refute Favorite.exists?(favorite.id)
  end

  def test_finders_return_recent_favorites_first
    article = Article.create!(title: "Rails")
    older = Favorite.create!(favable: article, note: "Older", created_at: Time.now - 172_800, updated_at: Time.now - 172_800)
    newer = Favorite.create!(favable: article, note: "Newer", created_at: Time.now - 86_400, updated_at: Time.now - 86_400)

    assert_equal [newer.id, older.id], Article.find_favorites_for(article).pluck(:id)
    assert_equal [newer.id, older.id], article.favorites_ordered_by_submitted.pluck(:id)
  end

  def test_user_finders_are_scoped_to_the_favable_type
    user = User.create!(name: "Andy")
    article = Article.create!(title: "Rails")
    photo = Photo.create!(title: "Ruby")
    article_favorite = Favorite.create!(favable: article, user: user)
    Favorite.create!(favable: photo, user: user)

    assert_equal [article_favorite.id], Article.find_favorites_by_user(user).pluck(:id)
  end

  def test_favorite_scopes_and_user_finder
    user = User.create!(name: "Andy")
    article = Article.create!(title: "Rails")
    older = Favorite.create!(favable: article, user: user, created_at: Time.now - 172_800, updated_at: Time.now - 172_800)
    newer = Favorite.create!(favable: article, user: user, created_at: Time.now - 86_400, updated_at: Time.now - 86_400)

    assert_equal [older.id, newer.id], Favorite.in_order.pluck(:id)
    assert_equal [newer.id, older.id], Favorite.recent.pluck(:id)
    assert_equal [newer.id, older.id], Favorite.find_favorites_by_user(user).pluck(:id)
  end

  def test_polymorphic_finders_follow_active_record_sti_rules
    article = SpecialArticle.create!(title: "Rails STI")
    favorite = Favorite.create!(favable: article)

    assert_equal Article.polymorphic_name, favorite.favable_type
    assert_equal article, Favorite.find_favable(favorite.favable_type, favorite.favable_id)
  end
end
