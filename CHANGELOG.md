# Changelog

All notable changes to this project are documented here.

## Unreleased

- Modernize Active Record integration with `ActiveSupport.on_load` and `ActiveSupport::Concern`.
- Preserve the public `acts_as_favable` and `Favorite.find_*` APIs while using Rails' own polymorphic naming APIs for STI and namespaced models.
- Make the generator emit the migration version for the Rails version that is actually running instead of hard-coding Rails 8.0.
- Keep the generated `user` association optional to preserve historical behavior and align it with a nullable `user_id` column.
- Require a polymorphic favorite target in newly generated migrations.
- Remove the generated `default_scope`; use `recent` and `in_order` explicitly.
- Add real Active Record behavior tests and generator coverage.
- Add GitHub Actions coverage for Rails 7.2, 8.0, and 8.1 across Ruby 3.1 through 4.0.
- Modernize gem metadata, dependency bounds, packaging, and development documentation.
- Remove obsolete Rails plugin entry points (`init.rb` and `install.rb`).

## 2.0.0 - 2025-07-28

- Added initial Rails 8 compatibility work.
- Updated the gem to modern keyword arguments for `has_many` options.
- Replaced deprecated Active Record APIs used by the original implementation.
- Updated generated model and migration templates for then-current Rails conventions.
