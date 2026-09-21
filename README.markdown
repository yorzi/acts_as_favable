Acts As Favable
=================

`acts_as_favable` is a small Active Record extension for adding polymorphic favorites to multiple models.

The gem keeps its original API while modernizing the integration for current Rails applications: lazy Active Record loading, Rails-aware polymorphic type handling, a version-aware generator, automated tests, and a CI compatibility matrix.

## Compatibility

The minimum supported Rails version is **Rails 7.2**.

The project is tested against:

- Ruby 3.1 with Rails 7.2
- Ruby 3.2 with Rails 8.0
- Ruby 3.2, 3.3, 3.4, and 4.0 with Rails 8.1

Rails 8.1 is the primary current target, while Rails 7.2 is an intentionally supported compatibility floor rather than a best-effort legacy lane. Changes to the gem should continue to preserve Rails 7.2 compatibility unless the minimum supported version is explicitly raised in a future release.

Applications should still follow the upstream Rails maintenance policy when choosing a production Rails version.

## Installation

Add the gem to your application's `Gemfile`:

```ruby
gem "acts_as_favable"
```

Then install dependencies and generate the model and migration:

```bash
bundle install
bin/rails generate favorite
bin/rails db:migrate
```

The generator uses the migration version of the Rails version running your application. It does not hard-code a specific Rails migration version.

## Usage

Make any Active Record model favable:

```ruby
class Article < ApplicationRecord
  acts_as_favable
end
```

Create favorites through the association:

```ruby
article = Article.find(1)
article.favorites.create!(note: "Read this again")
```

### Optional user association

The generated `Favorite` model intentionally defines `user` as optional:

```ruby
class Favorite < ApplicationRecord
  include ActsAsFavable::Favorite

  belongs_to :favable, polymorphic: true
  belongs_to :user, optional: true
end
```

This is the default gem policy. A favorite can exist without a user:

```ruby
article.favorites.create!(note: "Read this again")
```

Applications that associate favorites with users can still pass one normally:

```ruby
article.favorites.create!(
  note: "Read this again",
  user: current_user
)
```

If every favorite in a particular application must belong to a user, that application can tighten the generated model to `belongs_to :user` and make `user_id` non-null in its migration before running it. The gem itself will continue to generate an optional user association by default.

## Querying favorites

The generated `Favorite` model includes two explicit ordering scopes:

```ruby
article.favorites.recent
article.favorites.in_order
```

The original finder API is also supported:

```ruby
Article.find_favorites_for(article)
Article.find_favorites_by_user(user)

Favorite.find_favorites_by_user(user)
Favorite.find_favorites_for_favable(Article.polymorphic_name, article.id)
Favorite.find_favable(favorite.favable_type, favorite.favable_id)
```

`acts_as_favable` uses Active Record's polymorphic naming APIs, so finder behavior follows Rails' STI and namespacing rules instead of reimplementing them.

## Association options

Options passed to `acts_as_favable` are forwarded to the generated `has_many :favorites` association. The default is `dependent: :destroy`.

```ruby
class AuditRecord < ApplicationRecord
  acts_as_favable dependent: :delete_all
end
```

## Generated files

`bin/rails generate favorite` creates:

```text
app/models/favorite.rb
db/migrate/<timestamp>_create_favorites.rb
```

The migration creates indexed `favable_type`, `favable_id`, and `user_id` columns. The polymorphic target is required; `user_id` is nullable by design.

## Upgrading from older versions

Older versions of this project originated as a Rails plugin. Modern Rails applications do not use the historical `init.rb` or `install.rb` plugin entry points.

If you are upgrading an existing application, review your existing `favorites` table and model before running the generator. The generator is intended for new installations; it should not replace an existing migration or model without review.

The generated model no longer adds a `default_scope`. Use `recent` or `in_order` explicitly where ordering matters. Existing application models are not changed automatically.

## Development

Install dependencies and run the test suite:

```bash
bundle install
bundle exec rake test
```

Run against a specific supported Rails series:

```bash
RAILS_VERSION=7.2 bundle exec rake test
RAILS_VERSION=8.0 bundle exec rake test
RAILS_VERSION=8.1 bundle exec rake test
```

Rails 7.2 is the compatibility floor and must remain represented in CI while it is a supported gem target.

Build the gem locally:

```bash
bundle exec rake build
```

See `CONTRIBUTING.md` for contribution guidelines and `CHANGELOG.md` for notable changes.

## License

MIT. See `MIT-LICENSE`.

## Credits

The original implementation was influenced by the early Rails `acts_as_*` plugin ecosystem, including `acts_as_taggable` and `acts_as_commentable`-style projects.
